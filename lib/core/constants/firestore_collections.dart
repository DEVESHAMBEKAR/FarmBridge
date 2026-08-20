/// Centralized Firestore collection and field name constants.
/// Prevents typos and provides a single source of truth for all database paths.
class FirestoreCollections {
  FirestoreCollections._();

  // ─── Top-Level Collections ────────────────────────────────────
  static const String users = 'users';
  
  // Products & Marketplaces
  static const String products = 'products';
  
  // Consumer
  static const String orders = 'orders';
  static const String carts = 'carts';
  
  // Dealer / Bulk
  static const String requirements = 'dealer_requirements';
  static const String offers = 'dealer_offers';
  static const String negotiations = 'negotiations';
  static const String deals = 'deals';
  
  // Logistics
  static const String logisticsRequests = 'logistics_requests';
  static const String transportQuotes = 'transport_quotes';
  static const String transportBookings = 'transport_bookings';
  static const String deliveries = 'deliveries';

  // Cross-Cutting
  static const String chats = 'chats';
  static const String wallets = 'wallets';
  static const String reviews = 'reviews';
  static const String notifications = 'notifications';
  static const String auditLogs = 'audit_logs';
  static const String supportTickets = 'support_tickets';
  static const String platformSettings = 'platform_settings';

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
  static const String verificationStatus = 'verification_status';
  static const String fcmToken = 'fcm_token';

  // ─── Products ─────────────────────────────────────────────────
  static const String farmerId = 'farmer_id';
  static const String farmerName = 'farmer_name';
  static const String category = 'category';
  static const String pricePerUnit = 'price_per_unit';
  static const String availableQuantity = 'available_quantity';
  static const String listingType = 'listing_type'; // e.g. retail, bulk, both

  // ─── Orders/Deals ─────────────────────────────────────────────
  static const String buyerId = 'buyer_id';
  static const String dealerId = 'dealer_id';
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
  static const String buyer = 'buyer'; // Consumer
  static const String dealer = 'dealer'; // Bulk Buyer
  static const String wholesaler = 'wholesaler';
  static const String retailer = 'retailer';
  static const String logistics = 'logistics';
  static const String admin = 'admin';
  static const String systemAdmin = 'system_admin';
}

/// Verification / User Status constants.
class UserStatus {
  UserStatus._();

  static const String pending = 'PENDING';
  static const String underReview = 'UNDER_REVIEW';
  static const String approved = 'APPROVED';
  static const String rejected = 'REJECTED';
  static const String suspended = 'SUSPENDED';
  static const String active = 'ACTIVE';
  static const String inactive = 'INACTIVE';
  static const String blocked = 'BLOCKED';
  static const String archived = 'ARCHIVED';
}

/// Product status constants.
class ProductStatus {
  ProductStatus._();

  static const String active = 'ACTIVE';
  static const String soldOut = 'SOLD_OUT';
  static const String draft = 'DRAFT';
  static const String removed = 'REMOVED';
}

/// Deal status constants (for B2B Negotiations/Deals).
class DealStatus {
  DealStatus._();

  static const String negotiating = 'NEGOTIATING';
  static const String agreed = 'AGREED';
  static const String paymentPending = 'PAYMENT_PENDING';
  static const String transportPending = 'TRANSPORT_PENDING';
  static const String pickupScheduled = 'PICKUP_SCHEDULED';
  static const String pickedUp = 'PICKED_UP';
  static const String inTransit = 'IN_TRANSIT';
  static const String delivered = 'DELIVERED';
  static const String completed = 'COMPLETED';
  static const String cancelled = 'CANCELLED';
  static const String disputed = 'DISPUTED';
  static const String expired = 'EXPIRED';
}

/// Order status constants (for Consumer Orders).
class OrderStatus {
  OrderStatus._();

  static const String placed = 'PLACED';
  static const String confirmed = 'CONFIRMED';
  static const String packed = 'PACKED';
  static const String inTransit = 'IN_TRANSIT';
  static const String delivered = 'DELIVERED';
  static const String cancelled = 'CANCELLED';
  static const String disputed = 'DISPUTED';
}

/// Payment status constants.
class PaymentStatus {
  PaymentStatus._();

  static const String pending = 'PENDING';
  static const String paid = 'PAID';
  static const String refunded = 'REFUNDED';
  static const String failed = 'FAILED';
}
