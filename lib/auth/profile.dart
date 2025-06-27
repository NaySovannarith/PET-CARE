import 'package:flutter/material.dart';
import 'package:pet_care1/pet/add_pet_screen.dart';
import '../pet/Order_screen.dart';
import 'auth_service.dart';
import 'edit_profile.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = authService.value.currentUser;
    final userName = user?.displayName ?? 'no account';
    final userEmail = user?.email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              userName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              userEmail,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(height: 40, thickness: 1),
            const Text(
              'About me',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildMenuOption(
              'Edit Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                );
              },
            ),
            _buildMenuOption(
              'My Orders',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyOrdersScreen(),
                  ),
                );
              },
            ),
            _buildMenuOption(
              'My Pets',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddPetScreen()),
                );
              },
            ),
            _buildMenuOption('Help Center'),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await authService.value.signOut();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text('Log out', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption(String title, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
