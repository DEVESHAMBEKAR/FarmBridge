import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/requirement_model.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../app/theme/app_colors.dart';

class PostRequirementScreen extends ConsumerStatefulWidget {
  const PostRequirementScreen({super.key});

  @override
  ConsumerState<PostRequirementScreen> createState() => _PostRequirementScreenState();
}

class _PostRequirementScreenState extends ConsumerState<PostRequirementScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cropVarietyController = TextEditingController();
  final _quantityController = TextEditingController();
  final _locationController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _targetPriceController = TextEditingController();
  final _maxBudgetController = TextEditingController();
  
  String _selectedCategory = 'vegetables';
  String _selectedGrade = 'A';
  DateTime? _requiredDate;
  bool _isLoading = false;

  Future<void> _submitRequirement() async {
    if (!_formKey.currentState!.validate() || _requiredDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and select a date.')),
      );
      return;
    }

    final user = ref.read(currentUserProvider);
    if (user == null) return;

    setState(() => _isLoading = true);

    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final requirementId = firestoreRepo.generateDocId(FirestoreCollections.requirements);

      final req = RequirementModel(
        requirementId: requirementId,
        dealerId: user.uid,
        category: _selectedCategory,
        cropVariety: _cropVarietyController.text.trim(),
        quantity: double.parse(_quantityController.text.trim()),
        qualityGrade: _selectedGrade,
        locationName: _locationController.text.trim(),
        deliveryPincode: _pincodeController.text.trim(),
        requiredDate: _requiredDate!,
        targetPricePerUnit: double.parse(_targetPriceController.text.trim()),
        maxBudget: double.parse(_maxBudgetController.text.trim()),
        status: UserStatus.active,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await firestoreRepo.setDocument(
        collection: FirestoreCollections.requirements,
        documentId: requirementId,
        data: req.toJson(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Requirement posted successfully!')),
        );
        context.go('/dealer/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Requirement')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('What do you need?', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: 'vegetables', child: Text('Vegetables')),
                  DropdownMenuItem(value: 'fruits', child: Text('Fruits')),
                  DropdownMenuItem(value: 'grains', child: Text('Grains')),
                ],
                onChanged: (val) => setState(() => _selectedCategory = val!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cropVarietyController,
                decoration: const InputDecoration(labelText: 'Crop & Variety (e.g., Onion - Red)', border: OutlineInputBorder()),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Quantity (KG)', border: OutlineInputBorder()),
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedGrade,
                      decoration: const InputDecoration(labelText: 'Quality Grade', border: OutlineInputBorder()),
                      items: const [
                        DropdownMenuItem(value: 'A', child: Text('Grade A')),
                        DropdownMenuItem(value: 'B', child: Text('Grade B')),
                        DropdownMenuItem(value: 'C', child: Text('Grade C')),
                      ],
                      onChanged: (val) => setState(() => _selectedGrade = val!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Delivery Location (City/Hub)', border: OutlineInputBorder()),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _pincodeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Pincode', border: OutlineInputBorder()),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Required By Date'),
                subtitle: Text(_requiredDate != null ? "${_requiredDate!.toLocal()}".split(' ')[0] : 'Select Date'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 90)),
                  );
                  if (date != null) setState(() => _requiredDate = date);
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _targetPriceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Target Price/KG (₹)', border: OutlineInputBorder()),
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _maxBudgetController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Max Budget (₹)', border: OutlineInputBorder()),
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitRequirement,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: _isLoading 
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Post Requirement', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

