import 'package:flutter/material.dart';

class OwnerManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Owners'),
      ),
      body: Center(
        child: Text('Owner Management Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Owner Screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
