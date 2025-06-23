// my_pets_screen.dart
import 'package:flutter/material.dart';
import '../pet/add_pet_screen.dart';

class MyPetsScreen extends StatelessWidget {
  const MyPetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPetScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPetCard('Bella', '', 'Ready', context),
          _buildPetCard('Furry', '', 'Needs checkup', context),
          // Add more pets here or fetch from database
        ],
      ),
    );
  }

  Widget _buildPetCard(
    String name,
    String breed,
    String status,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.teal,
          child: CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/coco.jpg'),
          ),
        ),
        title: Text(name),
        subtitle: Text(breed),
        trailing: Chip(
          label: Text(status),
          backgroundColor:
              status == 'Ready' ? Colors.green[100] : Colors.orange[100],
        ),
        onTap: () {
          // Navigate to pet details
        },
      ),
    );
  }
}
