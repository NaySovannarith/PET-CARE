import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF40B94E),
        title: const Text(
          'Hey Pixel Posse,',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/coco_logo.png', height: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMyPetsSection(),
            const SizedBox(height: 16),
            _buildLocationAndStatus(),
            const SizedBox(height: 16),
            _buildPetFoodSection(),
            const SizedBox(height: 16),
            _buildVetsSection(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildMyPetsSection() {
    return _roundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Pets',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _circlePet('assets/images/dog1.png', 'Bella'),
              _circlePet('assets/images/dog2.png', 'Roudy'),
              _circlePet('assets/images/dog3.png', 'Furry'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationAndStatus() {
    return Row(
      children: [
        Expanded(
          child: _roundedCard(
            child: Column(
              children: [
                const Text(
                  'Pet Location',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/map.png', height: 100),
                const Text(
                  'Track Pets >',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _roundedCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pet Status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _statusBar('Health', 90),
                _statusBar('Food', 75),
                const SizedBox(height: 4),
                _statusBar('Health', 88),
                _statusBar('Food', 60),
                const Text(
                  'Check Pets >',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPetFoodSection() {
    return _roundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pet Food',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _petFoodItem(
            'assets/images/food1.png',
            'Josera',
            'Jos. Dog Master Mix. 500g',
          ),
          const Divider(),
          _petFoodItem(
            'assets/images/food2.png',
            'Happy Pet',
            'Happy Dog - Profi Line High Energy 30-20',
          ),
        ],
      ),
    );
  }

  Widget _buildVetsSection() {
    return _roundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Vets',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/vet.png'),
            ),
            title: const Text('Dr. Nambuvan'),
            subtitle: const Text(
              'Bachelor of veterinary science\n5.0 (150 reviews)\n2.5 km · 09:00 - 18:00',
            ),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Book Appointment'),
            ),
          ),
          const Text('Last Visit: 25/11/2022'),
        ],
      ),
    );
  }

  Widget _circlePet(String image, String name) {
    return Column(
      children: [
        CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
        const SizedBox(height: 4),
        Text(name),
      ],
    );
  }

  Widget _statusBar(String label, int percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percent / 100,
              backgroundColor: Colors.grey[200],
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 8),
          Text('$percent%'),
        ],
      ),
    );
  }

  Widget _petFoodItem(String image, String brand, String title) {
    return Row(
      children: [
        Image.asset(image, height: 60),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(brand, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(title),
            ],
          ),
        ),
        const Icon(Icons.shopping_bag_outlined, color: Colors.green),
      ],
    );
  }

  Widget _roundedCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: child,
    );
  }
}
