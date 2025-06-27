// lib/navbar/shop.dart
import 'package:flutter/material.dart';
import '../pages/dog_shop_page.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              print("No page to go back to!");
            }
          },
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
        padding: const EdgeInsets.all(12.0),
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
                  hintText: "Search keywords..",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Category Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CategoryIcon(
                  label: "Food",
                  icon: Icons.fastfood,
                  isActive: true,
                ),
                CategoryIcon(label: "Vet Items", icon: Icons.medical_services),
                CategoryIcon(label: "Accessories", icon: Icons.pets),
                CategoryIcon(label: "IOT Devices", icon: Icons.devices),
              ],
            ),

            const SizedBox(height: 16),

            // Tab bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TabButton(label: "Pets Food", isActive: true),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DogShopPage(),
                      ),
                    );
                  },
                  child: const TabButton(label: "For Dogs"),
                ),
                const TabButton(label: "For Cat"),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              "Popular Food",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.68,
                children: const [
                  ProductCard(
                    brand: "Me-O",
                    title: "Me-O Adult Cat Food Seafood 3kg",
                    price: "\$13.50",
                    imagePath: "assets/foods/meo.png",
                  ),
                  ProductCard(
                    brand: "Royal",
                    title: "Royal Canin Cat Food Mother & Baby Cat 2kg",
                    price: "\$30.00",
                    imagePath: "assets/foods/royal_baby.png",
                  ),
                  ProductCard(
                    brand: "Royal",
                    title: "Royal Canin Mini Puppy Dog Food 2kg",
                    price: "\$30.50",
                    imagePath: "assets/foods/royal_puppy.png",
                  ),
                  ProductCard(
                    brand: "Luv...",
                    title: "Luvcare Puppy Small Dog 2kg",
                    price: "\$9.50",
                    imagePath: "assets/foods/luvcare.png",
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

// Category Icon Widget
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

// Tab Button Widget
class TabButton extends StatelessWidget {
  final String label;
  final bool isActive;

  const TabButton({required this.label, this.isActive = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? Colors.orange[100] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? Colors.orange : Colors.grey.shade300,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.orange : Colors.black,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

// Product Card Widget
class ProductCard extends StatelessWidget {
  final String brand;
  final String title;
  final String price;
  final String imagePath;

  const ProductCard({
    required this.brand,
    required this.title,
    required this.price,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 8),
          Center(child: Image.asset(imagePath, height: 80)),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
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
