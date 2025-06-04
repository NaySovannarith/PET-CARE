
import 'package:flutter/material.dart';

class PetManage extends StatelessWidget {
  const PetManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Pets")),
      body: const Center(child: Text("This is My Pets mangement Page")),
    );
  }
}
