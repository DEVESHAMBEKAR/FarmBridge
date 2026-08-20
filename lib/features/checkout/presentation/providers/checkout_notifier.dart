import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/models/cart_model.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/constants/firestore_collections.dart';
import 'package:uuid/uuid.dart';

class CheckoutState {
  final bool isProcessing;
  final String? error;
  final bool success;

  const CheckoutState({
    this.isProcessing = false,
    this.error,
    this.success = false,
  });
}

class CheckoutNotifier extends StateNotifier<CheckoutState> {
  final Ref ref;

  CheckoutNotifier(this.ref) : super(const CheckoutState());

  Future<void> placeOrder({
    required CartModel cart,
    required List<CartItemModel> items,
    required String deliveryAddress,
    required String deliveryPincode,
    required String paymentMethod,
  }) async {
    state = const CheckoutState(isProcessing: true);
    
    try {
      final user = ref.read(currentUserProvider);
      if (user == null) throw Exception('User not logged in');
      
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      
      // We must group cart items by farmerId because an Order is tied to a single Farmer
      final Map<String, List<CartItemModel>> itemsByFarmer = {};
      for (var item in items) {
        itemsByFarmer.putIfAbsent(item.farmerId, () => []).add(item);
      }
      
      final uuid = const Uuid();
      final batch = FirebaseFirestore.instance.batch();

      for (final farmerId in itemsByFarmer.keys) {
        final farmerItems = itemsByFarmer[farmerId]!;
        
        // Calculate subtotal for this farmer's order
        double farmerSubtotal = 0.0;
        for (var item in farmerItems) {
          farmerSubtotal += item.lineTotal;
          
          // Decrement product stock
          final productRef = FirebaseFirestore.instance
              .collection(FirestoreCollections.products)
              .doc(item.productId);
          
          batch.update(productRef, {
            'available_quantity': FieldValue.increment(-item.quantity),
            'total_sold': FieldValue.increment(item.quantity),
          });
        }
        
        final deliveryFee = farmerSubtotal > 0 ? 25.0 : 0.0;
        final orderId = uuid.v4();
        
        // Create Order Document
        final orderRef = FirebaseFirestore.instance
            .collection(FirestoreCollections.orders)
            .doc(orderId);
            
        final order = OrderModel(
          orderId: orderId,
          buyerId: user.uid,
          buyerName: user.displayName,
          buyerPhone: user.phone ?? '',
          farmerId: farmerId,
          farmerName: farmerItems.first.title, // Simplified, ideal to fetch real farmer name
          deliveryAddress: deliveryAddress,
          deliveryPincode: deliveryPincode,
          status: 'placed',
          paymentStatus: paymentMethod == 'cod' ? 'pending' : 'paid',
          paymentMethod: paymentMethod,
          subtotal: farmerSubtotal,
          deliveryFee: deliveryFee,
          totalAmount: farmerSubtotal + deliveryFee,
          placedAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        
        batch.set(orderRef, order.toJson());
        
        // Add Order Items as Subcollection
        for (var item in farmerItems) {
          final orderItemRef = orderRef
              .collection(FirestoreCollections.orderItems)
              .doc(item.productId);
              
          final orderItem = OrderItemModel(
            productId: item.productId,
            productTitle: item.title,
            productImage: item.image,
            pricePerUnit: item.pricePerUnit,
            unit: item.unit,
            quantity: item.quantity,
            lineTotal: item.lineTotal,
          );
          
          batch.set(orderItemRef, orderItem.toJson());
        }
      }
      
      // Clear Cart Subcollection
      for (var item in items) {
        final cartItemRef = FirebaseFirestore.instance
            .collection(FirestoreCollections.carts)
            .doc(user.uid)
            .collection(FirestoreCollections.cartItems)
            .doc(item.productId);
        batch.delete(cartItemRef);
      }
      
      // Reset Parent Cart Document
      final cartRef = FirebaseFirestore.instance
          .collection(FirestoreCollections.carts)
          .doc(user.uid);
      batch.set(cartRef, {
        'item_count': 0,
        'subtotal': 0.0,
        'updated_at': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      
      // Commit the transaction
      await batch.commit();
      
      state = const CheckoutState(success: true, isProcessing: false);
    } catch (e) {
      state = CheckoutState(error: e.toString(), isProcessing: false);
    }
  }
}

final checkoutNotifierProvider = StateNotifierProvider<CheckoutNotifier, CheckoutState>((ref) {
  return CheckoutNotifier(ref);
});
