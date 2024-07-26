import 'package:flutter/material.dart';

class ContractorManagementScreen extends StatelessWidget {
  const ContractorManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Contractors'),
      ),
      body: const Center(
        child: Text('Contractor Management Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Contractor Screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
