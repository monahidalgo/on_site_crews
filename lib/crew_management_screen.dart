import 'package:flutter/material.dart';

class CrewManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Crews'),
      ),
      body: Center(
        child: Text('Crew Management Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Crew Screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
