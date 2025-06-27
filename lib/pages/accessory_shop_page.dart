import 'package:flutter/material.dart';

class AccessoryShopPage extends StatelessWidget {
  const AccessoryShopPage({super.key});

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
                CategoryIcon(label: "Food", icon: Icons.fastfood),
                CategoryIcon(label: "Vet Items", icon: Icons.medical_services),
                CategoryIcon(
                  label: "Accessories",
                  icon: Icons.pets,
                  isActive: true,
                ),
                CategoryIcon(label: "IOT Devices", icon: Icons.devices),
              ],
            ),
            const SizedBox(height: 16),

            const Center(
              child: Column(
                children: [
                  Text(
                    "ACCESSORIES",
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
              "Popular Accessories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
                children: const [
                  AccessoryProductCard(
                    brand: "Furry",
                    title: "Dog Collar",
                    price: "\$4.50",
                    imagePath: "assets/accessories/dog_collar.png",
                  ),
                  AccessoryProductCard(
                    brand: "Bella",
                    title: "Warm fleece vest",
                    price: "\$8.00",
                    imagePath: "assets/accessories/warm_vest.png",
                    sale: "-16%",
                  ),
                  AccessoryProductCard(
                    brand: "Roudy",
                    title: "Pet Nail Clipper & Claws Scissors",
                    price: "\$7.50",
                    imagePath: "assets/accessories/nail_clipper.png",
                  ),
                  AccessoryProductCard(
                    brand: "Furry",
                    title: "Flea Comb",
                    price: "\$5.00",
                    imagePath: "assets/accessories/flea_comb.png",
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

// Reuse CategoryIcon widget from existing files
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

// Product card for accessories
class AccessoryProductCard extends StatelessWidget {
  final String brand;
  final String title;
  final String price;
  final String imagePath;
  final String? sale;

  const AccessoryProductCard({
    required this.brand,
    required this.title,
    required this.price,
    required this.imagePath,
    this.sale,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
