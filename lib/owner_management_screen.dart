import 'package:flutter/material.dart';

class OwnerManagementScreen extends StatelessWidget {
  const OwnerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Owners'),
      ),
      body: const Center(
        child: Text('Owner Management Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Owner Screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
