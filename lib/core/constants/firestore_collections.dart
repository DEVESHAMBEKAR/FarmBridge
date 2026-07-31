/// Centralized Firestore collection and field name constants.
/// Prevents typos and provides a single source of truth for all database paths.
class FirestoreCollections {
  FirestoreCollections._();

  // ─── Top-Level Collections ────────────────────────────────────
  static const String users = 'users';
  static const String products = 'products';
  static const String orders = 'orders';
  static const String carts = 'carts';
  static const String chats = 'chats';
  static const String wallets = 'wallets';
  static const String reviews = 'reviews';
  static const String notifications = 'notifications';

  // ─── Subcollections ───────────────────────────────────────────
  static const String orderItems = 'items';
  static const String cartItems = 'items';
  static const String chatMessages = 'messages';
  static const String walletTransactions = 'transactions';
}

/// Common Firestore field name constants.
class FirestoreFields {
  FirestoreFields._();

  // ─── Shared ───────────────────────────────────────────────────
  static const String uid = 'uid';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
  static const String status = 'status';

  // ─── Users ────────────────────────────────────────────────────
  static const String role = 'role';
  static const String phone = 'phone';
  static const String email = 'email';
  static const String displayName = 'display_name';
  static const String photoUrl = 'photo_url';
  static const String isProfileComplete = 'is_profile_complete';
  static const String isVerified = 'is_verified';
  static const String fcmToken = 'fcm_token';

  // ─── Products ─────────────────────────────────────────────────
  static const String farmerId = 'farmer_id';
  static const String farmerName = 'farmer_name';
  static const String category = 'category';
  static const String pricePerUnit = 'price_per_unit';
  static const String availableQuantity = 'available_quantity';

  // ─── Orders ───────────────────────────────────────────────────
  static const String buyerId = 'buyer_id';
  static const String deliveryPartnerId = 'delivery_partner_id';
  static const String placedAt = 'placed_at';
  static const String paymentStatus = 'payment_status';
  static const String totalAmount = 'total_amount';

  // ─── Chats ────────────────────────────────────────────────────
  static const String participants = 'participants';
  static const String lastMessageAt = 'last_message_at';
  static const String senderId = 'sender_id';

  // ─── Notifications ────────────────────────────────────────────
  static const String userId = 'user_id';
  static const String isRead = 'is_read';

  // ─── Reviews ──────────────────────────────────────────────────
  static const String productId = 'product_id';
  static const String rating = 'rating';
}

/// User role constants.
class UserRoles {
  UserRoles._();

  static const String farmer = 'farmer';
  static const String buyer = 'buyer';
  static const String wholesaler = 'wholesaler';
  static const String logistics = 'logistics';
  static const String admin = 'admin';
}

/// Product status constants.
class ProductStatus {
  ProductStatus._();

  static const String active = 'active';
  static const String soldOut = 'sold_out';
  static const String draft = 'draft';
  static const String removed = 'removed';
}

/// Order status constants.
class OrderStatus {
  OrderStatus._();

  static const String placed = 'placed';
  static const String confirmed = 'confirmed';
  static const String packed = 'packed';
  static const String inTransit = 'in_transit';
  static const String delivered = 'delivered';
  static const String cancelled = 'cancelled';
  static const String disputed = 'disputed';
}

/// Payment status constants.
class PaymentStatus {
  PaymentStatus._();

  static const String pending = 'pending';
  static const String paid = 'paid';
  static const String refunded = 'refunded';
  static const String failed = 'failed';
}
