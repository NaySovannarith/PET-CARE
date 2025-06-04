import 'package:flutter/material.dart';
import 'navbar/shop.dart';
import 'navbar/vet.dart';
import 'navbar/manage.dart';
//import 'navbar/discover.dart';
import 'widgets/insert_link.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF40B94E),
        title: const Text('Hey User,', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              // backgroundColor: Colors.white,
              radius: 20,
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/coco.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMyPetsSection(context),
            const SizedBox(height: 16),
            _buildLocationAndStatus(context),
            const SizedBox(height: 16),
            _buildPetFoodSection(context),
            const SizedBox(height: 16),
            _buildVetsSection(context),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildMyPetsSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PetManage()),
        );
      },
      child: _roundedCard(
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
                _circlePet('assets/puppy4.jpg', 'Bella'),
                _circlePet('assets/puppy3.png', 'Roudy'),
                _circlePet('assets/puppy11.jpg', 'Furry'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationAndStatus(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigate to a map or location tracking page
              launchToUrl('https://www.google.com/maps/place/Institute+of+Technology+of+Cambodia/@11.5693377,104.8957306,16.9z/data=!4m6!3m5!1s0x3109517388680e15:0x63057e6682968f5!8m2!3d11.5703975!4d104.8980857!16zL20vMDZ5dmhz?entry=ttu&g_ep=EgoyMDI1MDYwMS4wIKXMDSoASAFQAw%3D%3D');
            },
            child: _roundedCard(
              child: Column(
                children: [
                  const Text(
                    'Pet Location',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/map.png', height: 100),
                  const Text(
                    'Track Pets >',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
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
                _statusBar('Food', 20),
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

  Widget _buildPetFoodSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PetsShop()),
        );
      },
      child: _roundedCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pet Food',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _petFoodItem(
              'assets/pet_food.jpg',
              'Josera',
              'Jos. Dog Master Mix. 500g',
            ),
            const Divider(),
            _petFoodItem(
              'assets/pet_food.jpg',
              'Happy Pet',
              'Happy Dog - Profi Line High Energy 30-20',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVetsSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VET()),
        );
      },
      child: _roundedCard(
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
