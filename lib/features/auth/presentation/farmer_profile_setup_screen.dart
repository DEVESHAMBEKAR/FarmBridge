import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/models/user_model.dart';
import 'providers/farmer_profile_setup_notifier.dart';

class FarmerProfileSetupScreen extends ConsumerStatefulWidget {
  const FarmerProfileSetupScreen({super.key});

  @override
  ConsumerState<FarmerProfileSetupScreen> createState() => _FarmerProfileSetupScreenState();
}

class _FarmerProfileSetupScreenState extends ConsumerState<FarmerProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  double? _latitude;
  double? _longitude;
  bool _isGettingLocation = false;
  
  final _farmNameController = TextEditingController();
  final _farmAddressController = TextEditingController();
  final _farmSizeController = TextEditingController();
  
  bool _isOrganic = false;
  final List<String> _selectedCrops = [];
  
  final List<String> _availableCrops = [
    'Wheat', 'Rice', 'Maize', 'Tomatoes', 'Potatoes', 
    'Onions', 'Carrots', 'Apples', 'Bananas', 'Mangoes',
    'Cotton', 'Sugarcane',
  ];

  @override
    Future<void> _getCurrentLocation() async {
    setState(() => _isGettingLocation = true);
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        _latitude = position.latitude;
        _longitude = position.longitude;
        
        final placemarks = await Geocoding().placemarkFromCoordinates(position.latitude, position.longitude);
        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          setState(() {
            _farmAddressController.text = '${place.street ?? ''} ${place.subLocality ?? ''}'.trim();
          });
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
    _farmNameController.dispose();
    _farmAddressController.dispose();
    _farmSizeController.dispose();
    super.dispose();
  }

  void _toggleCrop(String crop) {
    setState(() {
      if (_selectedCrops.contains(crop)) {
        _selectedCrops.remove(crop);
      } else {
        _selectedCrops.add(crop);
      }
    });
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_selectedCrops.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one crop')),
      );
      return;
    }

    final profile = FarmerProfile(
      farmName: _farmNameController.text.trim(),
      farmAddress: _farmAddressController.text.trim(),
      farmSizeAcres: double.tryParse(_farmSizeController.text.trim()) ?? 0.0,
      cropsGrown: _selectedCrops,
      organicCertified: _isOrganic,
      bankAccountLinked: false, // For later
    );

    final success = await ref.read(farmerProfileSetupNotifierProvider.notifier).saveProfile(profile);
    
    if (success && mounted) {
      context.go('/verification-pending');
    }
  }

  @override
  Widget build(BuildContext context) {
    final setupState = ref.watch(farmerProfileSetupNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Setup Farm Profile',
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
                    'Tell us about your farm',
                    style: AppTypography.displaySmall.copyWith(color: AppColors.onBackground),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This helps buyers find you and trust your produce.',
                    style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 32),
                  
                  // Farm Name
                  TextFormField(
                    controller: _farmNameController,
                    decoration: InputDecoration(
                      labelText: 'Farm Name (or Your Name)',
                      prefixIcon: const Icon(Icons.agriculture, color: AppColors.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 24),

                  // Farm Address
                  OutlinedButton.icon(
                    onPressed: _isGettingLocation ? null : _getCurrentLocation,
                    icon: _isGettingLocation ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.my_location),
                    label: const Text('Use Current Location'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _farmAddressController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: 'Farm Address / Village',
                      prefixIcon: const Icon(Icons.location_on, color: AppColors.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 24),

                  // Farm Size
                  TextFormField(
                    controller: _farmSizeController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Farm Size (in Acres)',
                      prefixIcon: const Icon(Icons.landscape, color: AppColors.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (v) => v == null || v.isEmpty ? 'Required field' : null,
                  ),
                  const SizedBox(height: 32),

                  // Organic Certification
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.outlineVariant.withOpacity(0.5)),
                    ),
                    child: SwitchListTile(
                      title: Text('Organic Certified', style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
                      subtitle: Text('Do you have organic certification?', style: AppTypography.bodySmall.copyWith(color: AppColors.onSurfaceVariant)),
                      value: _isOrganic,
                      activeColor: AppColors.primary,
                      onChanged: (val) => setState(() => _isOrganic = val),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Crops Grown
                  Text(
                    'Primary Crops Grown',
                    style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 12,
                    children: _availableCrops.map((crop) {
                      final isSelected = _selectedCrops.contains(crop);
                      return FilterChip(
                        label: Text(crop),
                        selected: isSelected,
                        onSelected: (_) => _toggleCrop(crop),
                        selectedColor: AppColors.primaryContainer,
                        checkmarkColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color: isSelected ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      );
                    }).toList(),
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
                          : Text('Complete Profile', style: AppTypography.labelLarge.copyWith(color: Colors.white, fontSize: 16)),
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

