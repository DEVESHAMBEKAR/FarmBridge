import 'dart:io';

void main() {
  final screens = [
    {'feature': 'farmer', 'name': 'add_new_crop', 'className': 'AddNewCropScreen'},
    {'feature': 'admin', 'name': 'admin_control_center', 'className': 'AdminControlCenterScreen'},
    {'feature': 'admin', 'name': 'admin_dashboard', 'className': 'AdminDashboardScreen'},
    {'feature': 'premium', 'name': 'agritech_premium', 'className': 'AgritechPremiumScreen'},
    {'feature': 'auth', 'name': 'bank_wallet_setup', 'className': 'BankWalletSetupScreen'},
    {'feature': 'marketplace', 'name': 'checkout', 'className': 'CheckoutScreen'},
    {'feature': 'logistics', 'name': 'delivery_route_details', 'className': 'DeliveryRouteDetailsScreen'},
    {'feature': 'auth', 'name': 'farm_details_verification', 'className': 'FarmDetailsVerificationScreen'},
    {'feature': 'farmer', 'name': 'farmer_analytics_dashboard', 'className': 'FarmerAnalyticsDashboardScreen'},
    {'feature': 'farmer', 'name': 'farmer_management_console', 'className': 'FarmerManagementConsoleScreen'},
    {'feature': 'auth', 'name': 'farmer_profile_setup', 'className': 'FarmerProfileSetupScreen'},
    {'feature': 'farmer', 'name': 'inventory_stock_management', 'className': 'InventoryStockManagementScreen'},
    {'feature': 'auth', 'name': 'language_selection', 'className': 'LanguageSelectionScreen'},
    {'feature': 'logistics', 'name': 'live_order_tracking', 'className': 'LiveOrderTrackingScreen'},
    {'feature': 'logistics', 'name': 'logistics_dashboard', 'className': 'LogisticsDashboardScreen'},
    {'feature': 'admin', 'name': 'marketplace_analytics', 'className': 'MarketplaceAnalyticsScreen'},
    {'feature': 'auth', 'name': 'onboarding_success', 'className': 'OnboardingSuccessScreen'},
    {'feature': 'marketplace', 'name': 'order_confirmation', 'className': 'OrderConfirmationScreen'},
    {'feature': 'marketplace', 'name': 'product_details', 'className': 'ProductDetailsScreen'},
    {'feature': 'logistics', 'name': 'supply_chain_logistics', 'className': 'SupplyChainLogisticsScreen'},
    {'feature': 'marketplace', 'name': 'wholesale_bulk_orders', 'className': 'WholesaleBulkOrdersScreen'},
  ];

  for (final screen in screens) {
    final feature = screen['feature']!;
    final name = screen['name']!;
    final className = screen['className']!;
    
    final dir = Directory('lib/features/$feature/presentation');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    final file = File('${dir.path}/${name}_screen.dart');
    if (!file.existsSync()) {
      file.writeAsStringSync('''import 'package:flutter/material.dart';

class $className extends StatelessWidget {
  const $className({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$className')),
      body: const Center(child: Text('$className Placeholder')),
    );
  }
}
''');
      print('Created $name');
    }
  }

  // Generate router additions
  final buffer = StringBuffer();
  for (final screen in screens) {
    final feature = screen['feature']!;
    final name = screen['name']!;
    buffer.writeln("import '../../features/$feature/presentation/${name}_screen.dart';");
  }
  buffer.writeln("\n// Router additions:");
  for (final screen in screens) {
    final name = screen['name']!;
    final className = screen['className']!;
    final routeName = name.replaceAll('_', '-');
    buffer.writeln('''      GoRoute(
        path: '/$routeName',
        name: '$routeName',
        builder: (context, state) => const $className(),
      ),''');
  }
  
  File('router_additions.txt').writeAsStringSync(buffer.toString());
  print('Done');
}
