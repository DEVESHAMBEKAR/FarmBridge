/// Abstract adapter interface for all logistics providers.
/// Implement this for each provider when their official API is available.
abstract class LogisticsProviderAdapter {
  /// Create a booking with the provider. Returns external booking ID or null.
  Future<String?> createBooking({required Map<String, dynamic> bookingDetails});

  /// Retrieve a tracking URL from an external booking reference.
  Future<String?> getTrackingUrl(String externalBookingId);

  /// Check the current status of a booking. Returns normalized status string.
  Future<String> getBookingStatus(String externalBookingId);

  /// Cancel an active booking. Returns true if cancelled successfully.
  Future<bool> cancelBooking(String externalBookingId);
}
