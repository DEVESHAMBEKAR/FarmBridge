import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class MarketplaceAnalyticsScreen extends StatelessWidget {
  const MarketplaceAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Marketplace Analytics'), backgroundColor: AppColors.surface),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildStatCard('Total Sales', '₹1.2M', Icons.monetization_on, Colors.green),
          _buildStatCard('Active Orders', '342', Icons.shopping_cart, Colors.blue),
          _buildStatCard('New Users', '+54', Icons.person_add, Colors.orange),
          _buildStatCard('Logistics', '89', Icons.local_shipping, Colors.purple),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
