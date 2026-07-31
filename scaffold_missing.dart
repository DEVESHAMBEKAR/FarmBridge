import 'dart:io';

void main() {
  final screens = [
    {'feature': 'auth', 'name': 'splash', 'className': 'SplashScreen'},
    {'feature': 'auth', 'name': 'otp', 'className': 'OtpScreen'},
    {'feature': 'buyer', 'name': 'buyer_home', 'className': 'BuyerHomeScreen'},
    {'feature': 'buyer', 'name': 'buyer_orders', 'className': 'BuyerOrdersScreen'},
    {'feature': 'chat', 'name': 'chat_list', 'className': 'ChatListScreen'},
    {'feature': 'chat', 'name': 'chat_conversation', 'className': 'ChatConversationScreen'},
    {'feature': 'profile', 'name': 'buyer_profile', 'className': 'BuyerProfileScreen'},
    {'feature': 'farmer', 'name': 'farmer_products', 'className': 'FarmerProductsScreen'},
    {'feature': 'farmer', 'name': 'farmer_orders', 'className': 'FarmerOrdersScreen'},
    {'feature': 'delivery', 'name': 'delivery_dashboard', 'className': 'DeliveryDashboardScreen'},
    {'feature': 'delivery', 'name': 'delivery_assigned', 'className': 'DeliveryAssignedScreen'},
    {'feature': 'delivery', 'name': 'delivery_map', 'className': 'DeliveryMapScreen'},
    {'feature': 'delivery', 'name': 'delivery_history', 'className': 'DeliveryHistoryScreen'},
    {'feature': 'profile', 'name': 'delivery_profile', 'className': 'DeliveryProfileScreen'},
    {'feature': 'settings', 'name': 'settings', 'className': 'SettingsScreen'},
    {'feature': 'notifications', 'name': 'notifications', 'className': 'NotificationsScreen'},
    {'feature': 'cart', 'name': 'cart', 'className': 'CartScreen'},
    {'feature': 'checkout', 'name': 'payment', 'className': 'PaymentScreen'},
    {'feature': 'admin', 'name': 'admin_users', 'className': 'AdminUsersScreen'},
    {'feature': 'admin', 'name': 'admin_farmers', 'className': 'AdminFarmersScreen'},
    {'feature': 'admin', 'name': 'admin_orders', 'className': 'AdminOrdersScreen'},
    {'feature': 'admin', 'name': 'admin_disputes', 'className': 'AdminDisputesScreen'},
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

  print('Done scaffolding missing screens');
}
