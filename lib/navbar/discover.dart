import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  bool showGrooming = true;

  final List<Map<String, dynamic>> nearbyGrooming = [
    {
      'name': 'Comb and Collar',
      'img': 'assets/grooming/groomingarea.jpg',
      'status': 'OPEN',
      'rating': '5.0',
      'reviews': '100 reviews',
      'distance': '2.5 km',
      'price': '100\$',
    },
    {
      'name': 'Cosmo Dog Cares',
      'img': 'assets/grooming/groomingarea1.jpg',
      'status': 'CLOSED',
      'rating': '5.0',
      'reviews': '100 reviews',
      'distance': '2 km',
      'price': '120\$',
    },
  ];

  final List<Map<String, dynamic>> recommendedGrooming = [
    {
      'name': 'Dirty Paws Dog Spa',
      'img': 'assets/grooming/groomingarea2.jpg',
      'status': 'OPEN',
      'rating': '5.0',
      'reviews': '100 reviews',
      'distance': '2.5 km',
      'price': '100\$',
    },
  ];

  final List<Map<String, dynamic>> nearbyBoarding = [
    {
      'name': 'Paw Palace Boarding',
      'img': 'assets/boarding/boarding1.jpg',
      'status': 'OPEN',
      'rating': '4.9',
      'reviews': '78 reviews',
      'distance': '1.8 km',
      'price': '90\$',
    },
    {
      'name': 'Tail Wag Inn',
      'img': 'assets/boarding/boarding2.jpg',
      'status': 'CLOSED',
      'rating': '4.8',
      'reviews': '112 reviews',
      'distance': '3.2 km',
      'price': '110\$',
    },
  ];

  final List<Map<String, dynamic>> recommendedBoarding = [
    {
      'name': 'Fur Seasons Stay',
      'img': 'assets/boarding/boarding3.jpg',
      'status': 'OPEN',
      'rating': '5.0',
      'reviews': '93 reviews',
      'distance': '2.4 km',
      'price': '105\$',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    final horizontalPadding = isLargeScreen ? screenWidth * 0.1 : 16.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text("Discover"),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              _buildCategoryToggle(),
              const Divider(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: showGrooming
                      ? _buildGroomingList(isLargeScreen)
                      : _buildBoardingList(isLargeScreen),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoryToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _toggleTab("Grooming", showGrooming, () {
            setState(() => showGrooming = true);
          }),
          const SizedBox(width: 30),
          _toggleTab("Boarding", !showGrooming, () {
            setState(() => showGrooming = false);
          }),
        ],
      ),
    );
  }

  Widget _toggleTab(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            label == "Grooming" ? Icons.cut : Icons.house,
            color: selected ? Colors.green : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.green : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroomingList(bool isLargeScreen) {
    return ListView(
      children: [
        _buildSection("Nearby Grooming", nearbyGrooming, isLargeScreen),
        const SizedBox(height: 20),
        _buildSection("Recommended Grooming", recommendedGrooming, isLargeScreen),
      ],
    );
  }

  Widget _buildBoardingList(bool isLargeScreen) {
    return ListView(
      children: [
        _buildSection("Nearby Boarding", nearbyBoarding, isLargeScreen),
        const SizedBox(height: 20),
        _buildSection("Recommended Boarding", recommendedBoarding, isLargeScreen),
      ],
    );
  }

  Widget _buildSection(String title, List<Map<String, dynamic>> list, bool isLargeScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(title),
        const SizedBox(height: 8),
        ...list.map((item) => _buildCard(item, isLargeScreen)).toList(),
      ],
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          const Text("See all", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> item, bool isLargeScreen) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item['img'],
                width: isLargeScreen ? 80 : 60,
                height: isLargeScreen ? 80 : 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(" ${item['rating']} (${item['reviews']})"),
                    ],
                  ),
                  Text(
                    item['status'],
                    style: TextStyle(
                      color: item['status'] == 'OPEN'
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14),
                      Text(" ${item['distance']}    "),
                      const Icon(Icons.attach_money, size: 14),
                      Text(item['price']),
                    ],
                  ),
                  const Text(
                    "Monday - Friday at 8.00 am - 5.00pm",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
