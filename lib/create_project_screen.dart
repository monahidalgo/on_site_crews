import 'package:flutter/material.dart';


class CreateProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Project'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Project Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Project Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save project logic
                Navigator.pop(context);
              },
              child: Text('Create Project'),
            ),
          ],
        ),
      ),
    );
  }
}
