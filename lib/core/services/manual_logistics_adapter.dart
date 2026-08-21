import 'logistics_adapter.dart';

/// Manual/External logistics adapter.
/// Used when the logistics provider has no direct API integration.
/// Admin enters booking details manually — FarmBridge still tracks the lifecycle.
class ManualLogisticsAdapter implements LogisticsProviderAdapter {
  @override
  Future<String?> createBooking({required Map<String, dynamic> bookingDetails}) async {
    // No API call. Admin enters external booking ID manually.
    return bookingDetails['external_booking_id'] as String?;
  }

  @override
  Future<String?> getTrackingUrl(String externalBookingId) async {
    // Return null — tracking URL entered manually by admin.
    return null;
  }

  @override
  Future<String> getBookingStatus(String externalBookingId) async {
    // Status is updated manually via admin panel.
    return 'UNKNOWN';
  }

  @override
  Future<bool> cancelBooking(String externalBookingId) async {
    // Manual cancellation — admin handles this via the dashboard.
    return true;
  }
}
