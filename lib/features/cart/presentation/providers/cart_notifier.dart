import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/cart_model.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/constants/firestore_collections.dart';

class CartState {
  final bool isLoading;
  final String? error;

  const CartState({this.isLoading = false, this.error});
}

class CartNotifier extends StateNotifier<CartState> {
  final Ref ref;

  CartNotifier(this.ref) : super(const CartState());

  Future<void> addToCart(ProductModel product, double quantity) async {
    state = const CartState(isLoading: true);
    try {
      final user = ref.read(currentUserProvider);
      if (user == null) {
        throw Exception('User not logged in');
      }

      final firestoreRepo = ref.read(firestoreRepositoryProvider);

      // Check if product is already in cart
      final cartItemDoc = await firestoreRepo.getDocument(
        collection: '${FirestoreCollections.carts}/${user.uid}/${FirestoreCollections.cartItems}',
        documentId: product.productId,
      );

      double newQuantity = quantity;
      if (cartItemDoc.exists && cartItemDoc.data() != null) {
        final existingItem = CartItemModel.fromJson(cartItemDoc.data()!);
        newQuantity += existingItem.quantity;
      }

      if (newQuantity > product.availableQuantity) {
        throw Exception('Cannot add more than available stock (${product.availableQuantity} ${product.unit})');
      }

      final lineTotal = newQuantity * product.pricePerUnit;

      final cartItem = CartItemModel(
        productId: product.productId,
        farmerId: product.farmerId,
        title: product.title,
        image: product.images.isNotEmpty ? product.images.first : '',
        pricePerUnit: product.pricePerUnit,
        unit: product.unit,
        quantity: newQuantity,
        lineTotal: lineTotal,
      );

      // Update the Cart Item
      await firestoreRepo.setDocument(
        collection: '${FirestoreCollections.carts}/${user.uid}/${FirestoreCollections.cartItems}',
        documentId: product.productId,
        data: cartItem.toJson(),
      );

      // Recalculate Cart Summary (In a real app, this might be done via Cloud Functions to prevent client tampering)
      // For MVP, we will query all items and update the parent doc.
      final allItemsSnap = await FirebaseFirestore.instance
          .collection(FirestoreCollections.carts)
          .doc(user.uid)
          .collection(FirestoreCollections.cartItems)
          .get();

      int itemCount = 0;
      double subtotal = 0.0;
      for (var doc in allItemsSnap.docs) {
        final item = CartItemModel.fromJson(doc.data());
        itemCount++;
        subtotal += item.lineTotal;
      }

      final cartModel = CartModel(
        userId: user.uid,
        itemCount: itemCount,
        subtotal: subtotal,
        updatedAt: DateTime.now(),
      );

      await firestoreRepo.setDocument(
        collection: FirestoreCollections.carts,
        documentId: user.uid,
        data: cartModel.toJson(),
      );

      state = const CartState(isLoading: false);
    } catch (e) {
      state = CartState(isLoading: false, error: e.toString());
    }
  }
  Future<void> updateQuantity(CartItemModel item, double newQuantity) async {
    state = const CartState(isLoading: true);
    try {
      final user = ref.read(currentUserProvider);
      if (user == null) {
        throw Exception('User not logged in');
      }

      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final itemCollectionPath = '${FirestoreCollections.carts}/${user.uid}/${FirestoreCollections.cartItems}';

      if (newQuantity <= 0) {
        // Remove item
        await firestoreRepo.deleteDocument(
          collection: itemCollectionPath,
          documentId: item.productId,
        );
      } else {
        // Check max stock (we need the product doc for this, but for simplicity, we can assume UI prevents going over if we don't have it, or we fetch it)
        final productDoc = await firestoreRepo.getDocument(
          collection: FirestoreCollections.products,
          documentId: item.productId,
        );
        
        if (productDoc.exists && productDoc.data() != null) {
          final product = ProductModel.fromJson(productDoc.data()!);
          if (newQuantity > product.availableQuantity) {
            throw Exception('Cannot add more than available stock (${product.availableQuantity} ${product.unit})');
          }
        }

        // Update item
        final updatedItem = item.copyWith(
          quantity: newQuantity,
          lineTotal: newQuantity * item.pricePerUnit,
        );
        
        await firestoreRepo.setDocument(
          collection: itemCollectionPath,
          documentId: item.productId,
          data: updatedItem.toJson(),
        );
      }

      // Recalculate summary
      final allItemsSnap = await FirebaseFirestore.instance
          .collection(FirestoreCollections.carts)
          .doc(user.uid)
          .collection(FirestoreCollections.cartItems)
          .get();

      int itemCount = 0;
      double subtotal = 0.0;
      for (var doc in allItemsSnap.docs) {
        final i = CartItemModel.fromJson(doc.data());
        itemCount++;
        subtotal += i.lineTotal;
      }

      final cartModel = CartModel(
        userId: user.uid,
        itemCount: itemCount,
        subtotal: subtotal,
        updatedAt: DateTime.now(),
      );

      await firestoreRepo.setDocument(
        collection: FirestoreCollections.carts,
        documentId: user.uid,
        data: cartModel.toJson(),
      );

      state = const CartState(isLoading: false);
    } catch (e) {
      state = CartState(isLoading: false, error: e.toString());
    }
  }
}

final cartNotifierProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier(ref);
});
