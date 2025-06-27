import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<String> services = [
    'Laboratory',
    'Telemedicine',
    'Dermatology',
    'Cardiology',
    'Endoscopy',
  ];

 String? expandedService = 'Telemedicine'; // Initially open Telemedicine

  void toggleService(String service) {
    setState(() {
      expandedService = expandedService == service ? null : service;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children:
              services.map((service) {
                final isExpanded = expandedService == service;

                return Column(
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
              }).toList(),
        ),
      ),
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
          children: [
            const Text(
              "We want it to be easy for you to get healthcare for your pet. Our telemedicine services help pet owners get quality veterinary care without having to make an appointment or drive across town.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              "You’d be surprised how many of the concerns you have about your pet can be resolved with a quick video call with one of our veterinarians. If there's something more serious going on, we can follow up with an in-home visit or appointment at our hospital.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
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
