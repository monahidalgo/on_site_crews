import 'package:flutter/material.dart';
import 'create_project_screen.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final List<Map<String, String>> projects = [
    {'name': 'Project Alpha', 'description': 'Description of Project Alpha'},
    {'name': 'Project Beta', 'description': 'Description of Project Beta'},
    {'name': 'Project Gamma', 'description': 'Description of Project Gamma'},
    {'name': 'Project Delta', 'description': 'Description of Project Delta'},
  ];

  void _addProject(Map<String, String> project) {
    setState(() {
      projects.add(project);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetailScreen(project: project),
                ),
              );
            },
            child: Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.build, color: Colors.blue),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project['name']!,
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          project['description']!,
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newProject = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateProjectScreen(),
            ),
          );
          if (newProject != null) {
            _addProject(newProject);
          }
        },
        tooltip: 'Create Project',
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
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
        backgroundColor: Colors.orange,
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
                  final tool = tools[index];
                  return ListTile(
                    title: Text(tool),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$tool coming soon!'),
                        ),
                      );
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
