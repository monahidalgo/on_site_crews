import 'package:flutter/material.dart';

class EmployeeManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Employees'),
      ),
      body: Center(
        child: Text('Employee Management Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Employee Screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
