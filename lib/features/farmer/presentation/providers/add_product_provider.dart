import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/constants/firestore_collections.dart';

class AddProductState {
  final bool isLoading;
  final String? error;

  const AddProductState({this.isLoading = false, this.error});
}

class AddProductNotifier extends StateNotifier<AddProductState> {
  final Ref ref;

  AddProductNotifier(this.ref) : super(const AddProductState());

  Future<bool> addProduct({
    required String title,
    required String description,
    required String category,
    required double pricePerUnit,
    required String unit,
    required double availableQuantity,
    required bool isOrganic,
    required List<File> images,
  }) async {
    state = const AddProductState(isLoading: true);

    try {
      final user = ref.read(currentUserProvider);
      if (user == null || user.role != UserRoles.farmer) {
        throw Exception('Unauthorized. Only farmers can add products.');
      }

      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final storageRepo = ref.read(storageRepositoryProvider);

      // 1. Generate a new product ID
      final productId = firestoreRepo.generateDocId(FirestoreCollections.products);

      // 2. Upload images to Storage
      List<String> imageUrls = [];
      if (images.isNotEmpty) {
        imageUrls = await storageRepo.uploadProductImages(
          farmerId: user.uid,
          productId: productId,
          files: images,
        );
      }

      // 3. Create the ProductModel
      final newProduct = ProductModel(
        productId: productId,
        farmerId: user.uid,
        farmerName: user.displayName,
        farmerPhotoUrl: user.photoUrl,
        title: title.trim(),
        description: description.trim(),
        category: category,
        pricePerUnit: pricePerUnit,
        unit: unit,
        availableQuantity: availableQuantity,
        isOrganic: isOrganic,
        images: imageUrls,
        status: ProductStatus.active,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // 4. Save to Firestore
      await firestoreRepo.setDocument(
        collection: FirestoreCollections.products,
        documentId: productId,
        data: newProduct.toJson(),
      );

      state = const AddProductState(isLoading: false);
      return true;
    } catch (e) {
      state = AddProductState(isLoading: false, error: e.toString());
      return false;
    }
  }
}

final addProductProvider =
    StateNotifierProvider.autoDispose<AddProductNotifier, AddProductState>((ref) {
  return AddProductNotifier(ref);
});
