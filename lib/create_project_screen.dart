import 'package:flutter/material.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Project Name'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Project Number'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save project logic
                Navigator.pop(context);
              },
              child: const Text('Create Project'),
            ),
          ],
        ),
      ),
    );
  }
}
