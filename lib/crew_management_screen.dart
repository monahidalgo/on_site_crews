import 'package:flutter/material.dart';

class CrewManagementScreen extends StatelessWidget {
  const CrewManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Crews'),
      ),
      body: const Center(
        child: Text('Crew Management Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Crew Screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
