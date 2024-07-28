import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fake projects for demonstration
    final projects = [
      {'name': 'Project Alpha', 'description': 'Description of Project Alpha'},
      {'name': 'Project Beta', 'description': 'Description of Project Beta'},
      {'name': 'Project Gamma', 'description': 'Description of Project Gamma'},
      {'name': 'Project Delta', 'description': 'Description of Project Delta'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ListTile(
            title: Text(project['name']!),
            subtitle: Text(project['description']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetailScreen(project: project),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProjectDetailScreen extends StatelessWidget {
  final Map<String, String> project;

  const ProjectDetailScreen({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      'Reports',
      'Tasks',
      'Invoices',
      'Photos',
      'Time-cards',
      'Chats',
      'Crews',
      'Equipment',
      'Materials',
      'Items',
      'Incidents',
      'Docs',
      'Contacts',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(project['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(project['description']!),
            const SizedBox(height: 20),
            const Text(
              'Add Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tools[index]),
                    onTap: () {
                      // Logic to add the tool to the project
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
