import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_image.png'), // Placeholder for profile image
            ),
            const SizedBox(height: 20),
            const Text(
              'Mona Hidalgo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'mona@biltsoft.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // Add more profile details here
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard'); // Navigate back to Dashboard
              },
              child: const Text('Back to Dashboard'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Logout and go to Login screen
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
