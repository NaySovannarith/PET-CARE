import 'package:flutter/material.dart';

class DogShopPage extends StatelessWidget {
  const DogShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Dog Food Shop",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dogs Food",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
