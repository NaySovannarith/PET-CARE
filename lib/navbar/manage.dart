import 'package:flutter/material.dart';
import '../auth/auth_service.dart';
import '../pet/add_pet_screen.dart';

class MyPetsScreen extends StatefulWidget {
  const MyPetsScreen({super.key});

  @override
  State<MyPetsScreen> createState() => _MyPetsScreenState();
}

class _MyPetsScreenState extends State<MyPetsScreen> {
  List<Map<String, dynamic>> _pets = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPets();
  }

  Future<void> _loadPets() async {
    try {
      final pets = await authService.value.getUserPets();
      setState(() {
        _pets = pets;
        _isLoading = false;
      });
    } catch (e) {
      print('❌ Failed to load pets: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _navigateToAddPet() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPetScreen()),
    );
    // Reload pets after returning
    _loadPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _navigateToAddPet),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _pets.isEmpty
              ? const Center(child: Text('No pets found. Add one!'))
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _pets.length,
                itemBuilder: (context, index) {
                  final pet = _pets[index];
                  return _buildPetCard(
                    pet['name'] ?? 'Unnamed',
                    pet['breed'] ?? '',
                    pet['gender'] ?? 'Unknown',
                  );
                },
              ),
    );
  }

  Widget _buildPetCard(String name, String breed, String gender) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.teal,
          backgroundImage: AssetImage('assets/coco.jpg'), // default image
        ),
        title: Text(name),
        subtitle: Text('Breed: $breed\nGender: $gender'),
        isThreeLine: true,
        trailing: const Icon(Icons.pets),
        onTap: () {
          // Add pet detail navigation here later
        },
      ),
    );
  }
}
