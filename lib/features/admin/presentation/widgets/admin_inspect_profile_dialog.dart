import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../app/theme/app_colors.dart';

class AdminInspectProfileDialog extends ConsumerStatefulWidget {
  final UserModel user;

  const AdminInspectProfileDialog({super.key, required this.user});

  @override
  ConsumerState<AdminInspectProfileDialog> createState() => _AdminInspectProfileDialogState();
}

class _AdminInspectProfileDialogState extends ConsumerState<AdminInspectProfileDialog> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  
  // Specific fields based on role
  late TextEditingController _farmNameController;
  late TextEditingController _vehicleNumberController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.displayName);
    _phoneController = TextEditingController(text: widget.user.phone ?? '');
    _emailController = TextEditingController(text: widget.user.email ?? '');
    
    _farmNameController = TextEditingController(text: widget.user.farmerProfile?.farmName ?? '');
    _vehicleNumberController = TextEditingController(text: widget.user.logisticsProfile?.vehicleNumber ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _farmNameController.dispose();
    _vehicleNumberController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    setState(() => _isLoading = true);
    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      
      Map<String, dynamic> updates = {
        'display_name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'email': _emailController.text.trim(),
      };

      if (widget.user.role == UserRoles.farmer && widget.user.farmerProfile != null) {
        final currentProfile = widget.user.farmerProfile!.toJson();
        currentProfile['farm_name'] = _farmNameController.text.trim();
        updates['farmer_profile'] = currentProfile;
      }

      if (widget.user.role == UserRoles.logistics && widget.user.logisticsProfile != null) {
        final currentProfile = widget.user.logisticsProfile!.toJson();
        currentProfile['vehicle_number'] = _vehicleNumberController.text.trim();
        updates['logistics_profile'] = currentProfile;
      }

      await firestoreRepo.updateDocument(
        collection: FirestoreCollections.users,
        documentId: widget.user.uid,
        data: updates,
      );

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error updating profile: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Inspect & Edit Profile', style: Theme.of(context).textTheme.titleLarge),
      content: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text('Role: ${widget.user.role.toUpperCase()}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email Address', border: OutlineInputBorder()),
              ),
              
              if (widget.user.role == UserRoles.farmer) ...[
                const Divider(height: 32),
                const Text('Farmer Details', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                TextField(
                  controller: _farmNameController,
                  decoration: const InputDecoration(labelText: 'Farm Name', border: OutlineInputBorder()),
                ),
              ],

              if (widget.user.role == UserRoles.logistics) ...[
                const Divider(height: 32),
                const Text('Logistics Details', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                TextField(
                  controller: _vehicleNumberController,
                  decoration: const InputDecoration(labelText: 'Vehicle Number', border: OutlineInputBorder()),
                ),
              ]
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _saveChanges,
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
          child: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Text('Save Changes'),
        ),
      ],
    );
  }
}
