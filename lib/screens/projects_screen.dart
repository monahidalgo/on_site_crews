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
  List<Map<String, String>> projects = [
    {'name': 'H Salt - Fish & Chips', 'description': 'Bring in H Salt inside'},
    {'name': 'Del Amo Mall', 'description': 'Maintenance of the project'},
    {'name': 'Del Taco', 'description': 'Renovate'},
    {'name': 'Disney Studios', 'description': 'Renovate'},
    {'name': 'Safeway', 'description': 'Concrete Work'},
    {'name': 'Cafe Rouge', 'description': 'Renovate'},
    // More projects
  ];

  final Color _backgroundColor = Colors.grey[100]!;
  List<Map<String, String>> filteredProjects = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredProjects = projects;
  }

  void _filterProjects(String query) {
    if (query.isNotEmpty) {
      filteredProjects = projects
          .where((project) =>
              project['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredProjects = projects;
    }
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects', style: TextStyle(fontFamily: 'Roboto')),
        backgroundColor: Colors.orange[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _filterProjects,
                decoration: InputDecoration(
                  hintText: 'Search projects...',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProjects.length,
                itemBuilder: (context, index) {
                  final project = filteredProjects[index];
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
                          vertical: 8.0, horizontal: 12.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.file_copy_outlined, // Construction-related icon
                          color: Colors.orange,
                          size: 30,
                        ),
                        title: Text(
                          project['name']!,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        subtitle: Text(
                          project['description']!,
                          style: const TextStyle(
                            fontSize: 14.0,
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
          ],
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
              projects.add(newProject);
              _filterProjects(searchQuery);
            });
          }
        },
        tooltip: 'Create Project',
        backgroundColor: Colors.orange[700],
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.orange,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildBottomNavIcon(
              icon: Icons.home,
              label: 'Home',
              onTap: () {
                // Home navigation
              },
            ),
            _buildBottomNavIcon(
              icon: Icons.assignment,
              label: 'Tasks',
              onTap: () {
                // Tasks navigation
              },
            ),
            _buildBottomNavIcon(
              icon: Icons.chat,
              label: 'Chat',
              onTap: () {
                // Chat navigation
              },
            ),
            _buildBottomNavIcon(
              icon: Icons.account_circle_outlined,
              label: 'Account',
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
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.black),
          Text(
            label,
            style: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Add search result handling
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = [
      'Del Taco',
      'Disney Studios',
      'Target'
    ]; // Example suggestions
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
        );
      },
    );
  }
}
