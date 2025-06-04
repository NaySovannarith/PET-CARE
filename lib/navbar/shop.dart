// screens/pets_page.dart
import 'package:flutter/material.dart';

class PetsShop extends StatelessWidget {
  const PetsShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Pets")),
      body: const Center(child: Text("This is My Pets Page")),
    );
  }
}
