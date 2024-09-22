import 'package:flutter/material.dart';
import 'package:on_site_crews/screens/create_project_screen.dart';
import 'package:on_site_crews/screens/profile_screen.dart'; // Import ProfileScreen
import 'package:on_site_crews/screens/project_detail_screen.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  // Updated projects list with sections
  List<Map<String, String>> projects = [
    {
      'name': 'Sherman Oaks Galleria Mall',
      'description': 'Bring in H Salt inside'
    },
    {'name': 'Bilt Soft', 'description': 'Media Offices'},
    {'name': 'Del taco', 'description': 'Renovate'},
    {'name': 'Disney Studios', 'description': 'Renovate'},
    {'name': 'Hospital Apps and Websites', 'description': 'Development'},
    {'name': 'Santa Monica Fish Market', 'description': 'Sea food sales'},
  ];

  // Customizable color for the background
  final Color _backgroundColor = Colors.grey[400]!; // Neutral dark background

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects', style: TextStyle(fontFamily: 'Roboto')),
        backgroundColor: Colors.blueGrey, // Neutral dark color for the app bar
        automaticallyImplyLeading: false, // Removes the top left arrow
      ),
      body: Container(
        color: _backgroundColor,
        child: SafeArea(
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              final color = _getProjectColor(project['name']!);

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProjectDetailsScreen(project: project),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 14.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12.0),
                    leading: CircleAvatar(
                      backgroundColor: color,
                      child: Text(
                        project['name']![0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    title: Text(
                      project['name']!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    subtitle: Text(
                      project['description']!,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newProject = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateProjectScreen(),
            ),
          );

          if (newProject != null) {
            setState(() {
              // Add the new project to the end of the list
              projects.add(newProject);
            });
          }
        },
        tooltip: 'Create Project',
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.grey[850],
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildBottomNavIcon(
              icon: Icons.home,
              label: 'Home',
              color: Colors.white,
              onTap: () {
                // Add navigation logic for Home
              },
            ),
            _buildBottomNavIcon(
              icon: Icons.assignment,
              label: 'Activity',
              color: Colors.white,
              onTap: () {
                // Add navigation logic for Activity
              },
            ),
            _buildBottomNavIcon(
              icon: Icons.chat,
              label: 'Chat',
              color: Colors.white,
              onTap: () {
                // Add navigation logic for Chat
              },
            ),
            _buildBottomNavIcon(
              icon: Icons.account_circle_outlined,
              label: 'Account',
              color: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavIcon({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            label,
            style: TextStyle(color: color, fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }

  Color _getProjectColor(String name) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.cyan,
      Colors.amber,
    ];
    return colors[name.codeUnitAt(0) % colors.length];
  }
}
