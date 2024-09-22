import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  final Map<String, String>? project;

  const NotesScreen({super.key, this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${project?['name'] ?? 'Project'} Notes'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Add a note',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save note logic here
              },
              child: const Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
