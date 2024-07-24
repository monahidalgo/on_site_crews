import 'package:flutter/material.dart';

class ContractorManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Contractors'),
      ),
      body: Center(
        child: Text('Contractor Management Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Contractor Screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
