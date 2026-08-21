import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/models/user_model.dart';
import 'providers/logistics_profile_setup_notifier.dart';

class LogisticsProfileSetupScreen extends ConsumerStatefulWidget {
  const LogisticsProfileSetupScreen({super.key});

  @override
  ConsumerState<LogisticsProfileSetupScreen> createState() => _LogisticsProfileSetupScreenState();
}

class _LogisticsProfileSetupScreenState extends ConsumerState<LogisticsProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  double? _latitude;
  double? _longitude;
  bool _isGettingLocation = false;
  
  final _nameController = TextEditingController();
  final _vehicleTypeController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  final _serviceAreaController = TextEditingController(); // Using a single text field for now

  Future<void> _getCurrentLocation() async {
    setState(() => _isGettingLocation = true);
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, timeLimit: const Duration(seconds: 10));
        _latitude = position.latitude;
        _longitude = position.longitude;
        
        try {
          final placemarks = await Geocoding().placemarkFromCoordinates(position.latitude, position.longitude);
          if (placemarks.isNotEmpty) {
            final place = placemarks.first;
            setState(() {
              _serviceAreaController.text = '${place.locality ?? ''}, ${place.administrativeArea ?? ''}'.trim();
            });
          }
        } catch (e) {
          setState(() {
            _serviceAreaController.text = 'Lat: ${position.latitude.toStringAsFixed(4)}, Lng: ${position.longitude.toStringAsFixed(4)}';
          });
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not fetch address. Using raw coordinates.')));
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to get location: $e')));
      }
    } finally {
      if (mounted) setState(() => _isGettingLocation = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _vehicleTypeController.dispose();
    _vehicleNumberController.dispose();
    _licenseNumberController.dispose();
    _serviceAreaController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    
    final areas = _serviceAreaController.text.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();

    final profile = LogisticsProfile(
      vehicleType: _vehicleTypeController.text.trim(),
      vehicleNumber: _vehicleNumberController.text.trim().toUpperCase(),
      licenseNumber: _licenseNumberController.text.trim().toUpperCase(),
      serviceArea: areas,
      isAvailable: true,
    );

    final success = await ref.read(logisticsProfileSetupNotifierProvider.notifier).saveProfile(profile, _nameController.text.trim(), latitude: _latitude, longitude: _longitude);
    
    if (success && mounted) {
      context.go('/verification-pending');
    }
  }

  @override
  Widget build(BuildContext context) {
    final setupState = ref.watch(logisticsProfileSetupNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Logistics Setup',
          style: AppTypography.headlineSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => context.go('/role-selection'),
            child: const Text('Change Role'),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fleet Information',
                    style: AppTypography.displaySmall.copyWith(color: AppColors.onBackground),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Provide details about your vehicle to start receiving delivery requests.',
                    style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 32),
                  
                  // Name
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name / Company Name',
                      prefixIcon: const Icon(Icons.business, color: AppColors.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 24),

                  // Vehicle Type
                  TextFormField(
                    controller: _vehicleTypeController,
                    decoration: InputDecoration(
                      labelText: 'Vehicle Type (e.g., Mini Truck, Van)',
                      prefixIcon: const Icon(Icons.local_shipping, color: AppColors.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 24),

                  // Vehicle Number
                  TextFormField(
                    controller: _vehicleNumberController,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: 'Vehicle Registration Number',
                      prefixIcon: const Icon(Icons.pin, color: AppColors.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 24),

                  // License Number
                  TextFormField(
                    controller: _licenseNumberController,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: 'Driving License Number',
                      prefixIcon: const Icon(Icons.badge, color: AppColors.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 24),

                  // Service Area
                  OutlinedButton.icon(
                    onPressed: _isGettingLocation ? null : _getCurrentLocation,
                    icon: _isGettingLocation ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.my_location),
                    label: const Text('Use Current Location as Service Area'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _serviceAreaController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: 'Service Areas (comma-separated pincodes/cities)',
                      prefixIcon: const Icon(Icons.map, color: AppColors.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      hintText: 'e.g., 110001, 110002, New Delhi',
                    ),
                    validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 48),

                  // Submit
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: setupState.isLoading ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      ),
                      child: setupState.isLoading
                          ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                          : Text('Complete Registration', style: AppTypography.labelLarge.copyWith(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          
          if (setupState.error != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: Text('Error: ${setupState.error}', style: const TextStyle(color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }
}


