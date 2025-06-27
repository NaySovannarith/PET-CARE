import 'package:flutter/material.dart';

class VetPage extends StatefulWidget {
  const VetPage({super.key});

  @override
  State<VetPage> createState() => _VetPageState();
}

class _VetPageState extends State<VetPage> {
  bool showVets = true;
  String? expandedService = 'Telemedicine';

  final List<Map<String, String>> vets = [
    {
      'name': 'Dr. Jennifer Dunlap',
      'title': 'Bachelor of Veterinary Science',
      'experience': '10 years',
      'distance': '2.5 km',
      'patients': '1006',
      'reviews': '100 reviews',
      'rating': '5.0',
      'img': 'assets/1.jpg',
    },
    {
      'name': 'Dr. Natalie Isaza',
      'title': 'Veterinary Dentist',
      'experience': '4 years',
      'distance': '2 km',
      'patients': '1205',
      'reviews': '100 reviews',
      'rating': '5.0',
      'img': 'assets/2.jpg',
    },
    {
      'name': 'Dr. Michelle Mayers',
      'title': 'Veterinary Surgeon',
      'experience': '6 years',
      'distance': '1.8 km',
      'patients': '1340',
      'reviews': '87 reviews',
      'rating': '4.8',
      'img': 'assets/5.jpg',
    },
    {
      'name': 'Dr. Victoria Smith',
      'title': 'Animal Behaviorist',
      'experience': '5 years',
      'distance': '3 km',
      'patients': '980',
      'reviews': '67 reviews',
      'rating': '4.9',
      'img': 'assets/3.jpg',
    },
    {
      'name': 'Dr. Heather Wilson-Robles',
      'title': 'Veterinary Nutritionist',
      'experience': '7 years',
      'distance': '2.2 km',
      'patients': '1155',
      'reviews': '91 reviews',
      'rating': '4.7',
      'img': 'assets/2.jpg',
    },
    {
      'name': 'Dr. Megan Brashear',
      'title': 'Pet Internal Medicine',
      'experience': '9 years',
      'distance': '1.5 km',
      'patients': '1230',
      'reviews': '102 reviews',
      'rating': '5.0',
      'img': 'assets/5.jpg',
    },
  ];

  final List<String> services = [
    'Laboratory',
    'Telemedicine',
    'Dermatology',
    'Cardiology',
    'Endoscopy',
  ];

  void toggleService(String service) {
    setState(() {
      expandedService = expandedService == service ? null : service;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text("Hello, How may I help you ?"),
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildTopToggle(),
          const Divider(thickness: 1),
          Expanded(child: showVets ? _buildVetList() : _buildServiceList()),
        ],
      ),
    );
  }

  Widget _buildTopToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _toggleTab("Veterinarians", showVets, () {
            setState(() => showVets = true);
          }),
          const SizedBox(width: 30),
          _toggleTab("Services", !showVets, () {
            setState(() => showVets = false);
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
            label == "Veterinarians" ? Icons.person : Icons.medical_services,
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

  Widget _buildVetList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Veterinarian",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: vets.length,
              itemBuilder: (context, index) {
                final vet = vets[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        vet['img'] ?? 'assets/vets/default.png',
                      ),
                      radius: 30,
                    ),
                    title: Text(vet['name']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(vet['title']!),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            Text(" ${vet['rating']} (${vet['reviews']})"),
                          ],
                        ),
                        Text(
                          "${vet['experience']} of experience • ${vet['distance']} • ${vet['patients']} patients",
                          style: const TextStyle(fontSize: 12),
                        ),
                        const Text(
                          "Monday - Friday @ 8:00 am - 5:00pm",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        final isExpanded = expandedService == service;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => toggleService(service),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      service,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(isExpanded ? Icons.remove : Icons.add),
                  ],
                ),
              ),
            ),
            if (isExpanded) _buildServiceDetail(service),
          ],
        );
      },
    );
  }

  Widget _buildServiceDetail(String service) {
    if (service == 'Telemedicine') {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "We want it to be easy for you to get healthcare for your pet. Our telemedicine services help pet owners get quality veterinary care without having to make an appointment or drive across town.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              "You’d be surprised how many of the concerns you have about your pet can be resolved with a quick video call with one of our veterinarians. If there's something more serious going on, we can follow up with an in-home visit or appointment at our hospital.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 12),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "$service services description coming soon...",
          style: const TextStyle(fontSize: 14),
        ),
      );
    }
  }
}
