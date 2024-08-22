import 'package:flutter/material.dart';
import 'package:on_site_crews/screens/project_detail_screen.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> with SingleTickerProviderStateMixin {
  final List<Map<String, String>> projects = [
    {'name': 'Sherman Oaks Mall', 'description': 'Bring in H Salt inside'},
    {'name': 'Sony Music', 'description': 'Media Offices'},
    {'name': 'Disneyland', 'description': 'Renovate'},
  ];

  late AnimationController _controller;
  late Animation<double> _animation;
  int _expandedIndex = -1; // Track the currently expanded index

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = -1; // Collapse if already expanded
        _controller.reverse();
      } else {
        _expandedIndex = index; // Expand the new index
        _controller.forward();
      }
    });
  }

  void _navigateToProjectDetailsScreen(Map<String, String> project) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetailsScreen(project: project),
      ),
    );
    if (result == 'closed') {
      setState(() {
        _expandedIndex = -1;
        _controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false, // Removes the top left arrow
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            final color = _getProjectColor(project['name']!);
            final isExpanded = _expandedIndex == index;

            return GestureDetector(
              onTap: () {
                _toggleExpansion(index);
                if (isExpanded) {
                  _navigateToProjectDetailsScreen(project);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                height: isExpanded ? 200.0 : 100.0, // Adjust heights as needed
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 1.0),
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
                  ),
                ),
                child: Card(
                  elevation: 4.0,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: color,
                          child: Text(
                            project['name']![0],
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project['name']!,
                                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8.0),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: isExpanded
                                    ? Text(
                                  project['description']!,
                                  style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                                )
                                    : Container(), // Hide description when collapsed
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_project_screen');
        },
        tooltip: 'Create Project',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBubbleIcon(
              icon: Icons.home,
              label: 'Home',
              color: Colors.red,
              index: 0,
            ),
            _buildBubbleIcon(
              icon: Icons.assignment,
              label: 'Activity',
              color: Colors.blue,
              index: 1,
            ),
            _buildBubbleIcon(
              icon: Icons.chat,
              label: 'Chat',
              color: Colors.green,
              index: 2,
            ),
            _buildBubbleIcon(
              icon: Icons.account_circle_outlined,
              label: 'Account',
              color: Colors.purple,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBubbleIcon({
    required IconData icon,
    required String label,
    required Color color,
    required int index,
  }) {
    final isExpanded = _expandedIndex == index;

    return GestureDetector(
      onTap: () => _toggleExpansion(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isExpanded ? 100 : 30, // Adjust widths as needed
        height: 40,
        decoration: BoxDecoration(
          color: isExpanded ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: isExpanded ? 12.0 : 0), // Move icon and text left
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isExpanded ? Colors.white : color,
            ),
            if (isExpanded) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ],
        ),
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
