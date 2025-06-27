// my_orders_screen.dart
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Post orders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildOrderItem('Service Adds Dry Des', ['\$2.00', '\$2.40', 'Custom (0:43) for \$5.50m']),
            _buildOrderItem('Service Adds Dry Des', ['\$2.00', '\$2.40', 'Custom (0:43) for \$5.50m']),
            _buildOrderItem('Service Pour Dry Des', ['\$2.00', '\$2.40', 'Custom (0:43) for \$5.50m']),
            _buildOrderItem('Daily Air Dry Des', ['\$2.00', '\$2.40', 'Custom (0:43) for \$5.50m']),
            _buildOrderItem('Work Wet Des', ['\$2.00', '\$2.40', 'Custom (0:43) for \$5.50m']),
            _buildOrderItem('Service Adds Dry Des', ['\$2.00', '\$2.40', 'Custom (0:43) for \$5.50m']),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String title, List<String> prices) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...prices.map((price) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(price),
            )).toList(),
          ],
        ),
      ),
    );
  }
}