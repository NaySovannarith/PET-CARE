import 'package:flutter/material.dart';
import 'navbar/shop.dart';
import 'navbar/vet.dart';
import 'navbar/manage.dart';
import 'widgets/insert_link.dart';
import 'auth/profile.dart';
import 'auth/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = '';

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  void fetchUserInfo() {
    final user = authService.value.currentUser;
    setState(() {
      username = user?.displayName ?? user?.email ?? 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF40B94E),
        title: Text(
          'Hey $username,',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 20,
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/coco.jpg'),
                ),
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
            _buildPetFoodSection(context),
            const SizedBox(height: 16),
            _buildVetsSection(context),
            const SizedBox(height: 16),
            _buildLocationAndStatus(context),
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
          MaterialPageRoute(builder: (context) => const MyPetsScreen()),
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
              launchToUrl(
                'https://www.google.com/maps/place/Institute+of+Technology+of+Cambodia/@11.5693377,104.8957306,16.9z/data=!4m6!3m5!1s0x3109517388680e15:0x63057e6682968f5!8m2!3d11.5703975!4d104.8980857!16zL20vMDZ5dmhz?entry=ttu&g_ep=EgoyMDI1MDYwMS4wIKXMDSoASAFQAw%3D%3D',
              );
            },
            child: _roundedCard(
              child: Column(
                children: [
                  const Text(
                    'Pet Location',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Image.asset('assets/map.png', height: 100),
                ],
              ),
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
          MaterialPageRoute(builder: (context) => const VetPage()),
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
                backgroundImage: AssetImage('assets/vet1.jpg'),
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
