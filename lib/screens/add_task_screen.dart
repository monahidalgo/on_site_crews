import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Assigned To'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save task logic
                Navigator.pop(context);
              },
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}
