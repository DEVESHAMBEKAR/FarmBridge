import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import '../../../core/providers/providers.dart';
import '../../../core/widgets/async_value_widget.dart';
import '../../../core/models/user_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../../core/constants/firestore_collections.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProfileStreamProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('My Profile', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.onSurfaceVariant), 
            onPressed: () => _showEditProfileDialog(context, ref)
          ),
        ],
      ),
      body: AsyncValueWidget<UserModel?>(
        value: userAsync,
        data: (user) {
          if (user == null) {
            return const Center(child: Text('User profile not found.'));
          }

          String address = 'Not set';
          if (user.role == 'buyer' && user.buyerProfile != null) {
            address = user.buyerProfile!.deliveryAddress;
          } else if (user.role == 'farmer' && user.farmerProfile != null) {
            address = user.farmerProfile!.farmAddress;
          } else if (user.role == 'dealer' && user.dealerProfile != null) {
            address = user.dealerProfile!.deliveryAddress;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileHeader(user),
                const SizedBox(height: 32),
                _buildSettingsGroup(
                  'Account Information',
                  [
                    _buildInfoTile(Icons.email, 'Email', user.email ?? 'No email'),
                    _buildInfoTile(Icons.phone, 'Phone', user.phone ?? 'No phone'),
                    _buildInfoTile(Icons.location_on, 'Address', address),
                    if (user.latitude != null && user.longitude != null)
                      _buildInfoTile(Icons.gps_fixed, 'GPS coordinates', '${user.latitude!.toStringAsFixed(4)}, ${user.longitude!.toStringAsFixed(4)}'),
                  ],
                ),
                const SizedBox(height: 24),
                if (user.role == 'farmer' && user.farmerProfile != null)
                  _buildSettingsGroup(
                    'Farm Details',
                    [
                      _buildInfoTile(Icons.agriculture, 'Farm Name', user.farmerProfile!.farmName),
                      _buildInfoTile(Icons.landscape, 'Farm Size', '${user.farmerProfile!.farmSizeAcres} Acres'),
                    ],
                  ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      ref.read(authRepositoryProvider).signOut();
                      context.go('/auth');
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => _EditProfileDialog(ref: ref),
    );
  }

  Widget _buildProfileHeader(UserModel user) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceContainerHigh,
            border: Border.all(color: AppColors.primaryContainer, width: 2),
          ),
          child: Center(
            child: Text(
              user.displayName.isNotEmpty ? user.displayName[0].toUpperCase() : 'U', 
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primary)
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.displayName.isNotEmpty ? user.displayName : 'User', style: AppTypography.headlineMedium.copyWith(color: AppColors.onSurface)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text('${user.role.toUpperCase()} ACCOUNT', style: AppTypography.labelSmall.copyWith(color: AppColors.onSecondaryContainer)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsGroup(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(title, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1.2)),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: AppColors.onSurfaceVariant),
      title: Text(title, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
      subtitle: Text(subtitle, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface)),
    );
  }
}

class _EditProfileDialog extends StatefulWidget {
  final WidgetRef ref;
  const _EditProfileDialog({required this.ref});

  @override
  State<_EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<_EditProfileDialog> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isGettingLocation = false;
  bool _isSaving = false;
  double? _lat;
  double? _lng;
  late UserModel? _user;

  @override
  void initState() {
    super.initState();
    _user = widget.ref.read(userProfileStreamProvider).value;
    if (_user != null) {
      _nameController.text = _user!.displayName;
      _lat = _user!.latitude;
      _lng = _user!.longitude;
      if (_user!.role == 'buyer' && _user!.buyerProfile != null) {
        _addressController.text = _user!.buyerProfile!.deliveryAddress;
      } else if (_user!.role == 'farmer' && _user!.farmerProfile != null) {
        _addressController.text = _user!.farmerProfile!.farmAddress;
      } else if (_user!.role == 'dealer' && _user!.dealerProfile != null) {
        _addressController.text = _user!.dealerProfile!.deliveryAddress;
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isGettingLocation = true);
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, timeLimit: const Duration(seconds: 10));
        _lat = position.latitude;
        _lng = position.longitude;
        
        try {
          final placemarks = await Geocoding().placemarkFromCoordinates(position.latitude, position.longitude);
          if (placemarks.isNotEmpty) {
            final place = placemarks.first;
            setState(() {
              _addressController.text = '${place.street ?? ''} ${place.subLocality ?? ''}'.trim();
            });
          }
        } catch (e) {
          setState(() {
            _addressController.text = 'Lat: ${position.latitude.toStringAsFixed(4)}, Lng: ${position.longitude.toStringAsFixed(4)}';
          });
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not fetch address. Using raw coordinates.')));
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

  Future<void> _saveProfile() async {
    if (_user == null) return;
    setState(() => _isSaving = true);
    
    try {
      final firestoreRepo = widget.ref.read(firestoreRepositoryProvider);
      
      Map<String, dynamic> updateData = {
        'display_name': _nameController.text.trim(),
        'latitude': _lat,
        'longitude': _lng,
      };

      if (_user!.role == 'buyer' && _user!.buyerProfile != null) {
        final newProfile = _user!.buyerProfile!.copyWith(deliveryAddress: _addressController.text.trim());
        updateData['buyer_profile'] = newProfile.toJson();
      } else if (_user!.role == 'farmer' && _user!.farmerProfile != null) {
        final newProfile = _user!.farmerProfile!.copyWith(farmAddress: _addressController.text.trim());
        updateData['farmer_profile'] = newProfile.toJson();
      } else if (_user!.role == 'dealer' && _user!.dealerProfile != null) {
        final newProfile = _user!.dealerProfile!.copyWith(deliveryAddress: _addressController.text.trim());
        updateData['dealer_profile'] = newProfile.toJson();
      }

      await firestoreRepo.updateDocument(
        collection: FirestoreCollections.users,
        documentId: _user!.uid,
        data: updateData,
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Profile'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Display Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _isGettingLocation ? null : _getCurrentLocation,
              icon: _isGettingLocation 
                  ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) 
                  : const Icon(Icons.my_location),
              label: const Text('Update with Current GPS Location'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: _isSaving ? null : _saveProfile,
          child: _isSaving ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Text('Save'),
        ),
      ],
    );
  }
}

