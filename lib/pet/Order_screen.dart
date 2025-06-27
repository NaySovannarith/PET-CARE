import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Post Orders',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _buildOrderItem('Service Adds Dry Des', [
            '\$2.00',
            '\$2.40',
            'Custom (0:43) for \$5.50',
          ]),
          _buildOrderItem('Service Adds Dry Des', [
            '\$2.00',
            '\$2.40',
            'Custom (0:43) for \$5.50',
          ]),
          _buildOrderItem('Service Pour Dry Des', [
            '\$2.00',
            '\$2.40',
            'Custom (0:43) for \$5.50',
          ]),
          _buildOrderItem('Daily Air Dry Des', [
            '\$2.00',
            '\$2.40',
            'Custom (0:43) for \$5.50',
          ]),
          _buildOrderItem('Work Wet Des', [
            '\$2.00',
            '\$2.40',
            'Custom (0:43) for \$5.50',
          ]),
          _buildOrderItem('Service Adds Dry Des', [
            '\$2.00',
            '\$2.40',
            'Custom (0:43) for \$5.50',
          ]),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String title, List<String> prices) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 10),
            ...prices.map(
              (price) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  price,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
