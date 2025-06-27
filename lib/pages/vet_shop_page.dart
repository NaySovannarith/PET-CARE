// lib/pages/vet_shop_page.dart
import 'package:flutter/material.dart';

class VetShopPage extends StatelessWidget {
  const VetShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Shop", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search ..",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Category Icons
            // Category Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Back to food
                  },
                  child: const CategoryIcon(
                    label: "Food",
                    icon: Icons.fastfood,
                  ),
                ),
                const CategoryIcon(
                  label: "Vet Items",
                  icon: Icons.medical_services,
                  isActive: true,
                ),
                const CategoryIcon(label: "Accessories", icon: Icons.pets),
                const CategoryIcon(label: "IOT Devices", icon: Icons.devices),
              ],
            ),

            const SizedBox(height: 16),

            // Header Title
            const Center(
              child: Column(
                children: [
                  Text(
                    "PRODUCTS",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "for your pets",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              " Vet Items",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Product Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
                children: const [
                  VetProductCard(
                    brand: "Furry",
                    title: "Wet Dog - Flea & Tick Spray",
                    volume: "210ml",
                    price: "\$10.00",
                    imagePath: "assets/vet_items/flea_tick.png",
                  ),
                  VetProductCard(
                    brand: "Bella",
                    title: "Orondo Spray",
                    volume: "250ml",
                    price: "\$3.00",
                    imagePath: "assets/vet_items/orondo1.png",
                    sale: "-16%",
                  ),
                  VetProductCard(
                    brand: "Roudy",
                    title: "Nexgard - Afoxolaner",
                    volume: "136mg",
                    price: "\$3.50",
                    imagePath: "assets/vet_items/nexgard.png",
                  ),
                  VetProductCard(
                    brand: "Furry",
                    title: "Petro Mange Cream",
                    volume: "70g",
                    price: "\$4.50",
                    imagePath: "assets/vet_items/mange_cream.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category Icon (copied from shop.dart for visual consistency)
class CategoryIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;

  const CategoryIcon({
    required this.label,
    required this.icon,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isActive ? Colors.green[400] : Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: isActive ? Colors.white : Colors.black,
            size: 28,
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Product Card for Vet Items
class VetProductCard extends StatelessWidget {
  final String brand;
  final String title;
  final String volume;
  final String price;
  final String imagePath;
  final String? sale;

  const VetProductCard({
    required this.brand,
    required this.title,
    required this.volume,
    required this.price,
    required this.imagePath,
    this.sale,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand label + Sale badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  brand,
                  style: TextStyle(fontSize: 12, color: Colors.orange[800]),
                ),
              ),
              if (sale != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    sale!,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Center(child: Image.asset(imagePath, height: 80)),
          const SizedBox(height: 8),
          Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(
            volume,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const Spacer(),
          Text(price, style: const TextStyle(color: Colors.green)),
          const SizedBox(height: 4),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined, size: 16),
            label: const Text("Add to cart"),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.green[700],
              side: BorderSide(color: Colors.green.shade400),
              minimumSize: const Size.fromHeight(36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
