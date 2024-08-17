import 'package:flutter/material.dart';
import 'dart:math';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> with SingleTickerProviderStateMixin {
  final List<Map<String, String>> projects = [
    {'name': 'Mall', 'description': 'Fix Top windows panels'},
    {'name': 'Build', 'description': 'Plans for Bilt Soft'},
    {'name': 'Park', 'description': 'Renovate playground'},
    {'name': 'Office', 'description': 'New workspaces setup'},
  ];

  late AnimationController _controller;
  late Animation<double> _animation;
  bool isFlipped1 = false;
  bool isFlipped2 = false;
  bool isFlipped3 = false;

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

  void _flipIcon(bool isFlipped, int iconNumber) {
    setState(() {
      if (iconNumber == 1) {
        isFlipped1 = !isFlipped1;
      } else if (iconNumber == 2) {
        isFlipped2 = !isFlipped2;
      } else if (iconNumber == 3) {
        isFlipped3 = !isFlipped3;
      }
    });

    if (isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  void _navigateToCreateProjectScreen() async {
    final result = await Navigator.pushNamed(context, '/create_project_screen');
    if (result == 'created') {
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  void _navigateToDashboardScreen(Map<String, String> project) {
    Navigator.pushNamed(
      context,
      '/dashboard',
      arguments: project,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false, // Removes the top left arrow
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          final color = _getProjectColor(project['name']!);

          return GestureDetector(
            onTap: () {
              _navigateToDashboardScreen(project);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                            Text(
                              project['description']!,
                              style: const TextStyle(fontSize: 12.0, color: Colors.grey),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateProjectScreen,
        tooltip: 'Create Project',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.rotationY(pi * _animation.value),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: isFlipped1
                        ? const Icon(Icons.home)
                        : const Icon(Icons.home_outlined),
                    color: Colors.red,  // Color for the first icon
                    onPressed: () {
                      _flipIcon(isFlipped1, 1);
                    },
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.rotationY(pi * _animation.value),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: isFlipped2
                        ? const Icon(Icons.assignment)
                        : const Icon(Icons.assignment_outlined),
                    color: Colors.blue,  // Color for the second icon
                    onPressed: () {
                      _flipIcon(isFlipped2, 2);
                    },
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.rotationY(pi * _animation.value),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: isFlipped3
                        ? const Icon(Icons.chat)
                        : const Icon(Icons.chat_bubble_outline),
                    color: Colors.green,  // Color for the third icon
                    onPressed: () {
                      _flipIcon(isFlipped3, 3);
                    },
                  ),
                );
              },
            ),
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
