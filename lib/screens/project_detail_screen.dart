import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Map<String, String>? project;

  const ProjectDetailsScreen({super.key, this.project});

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.project?['name'] ?? 'Project Details',
          style: const TextStyle(fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Overview Section
            _buildProjectOverview(),
            const SizedBox(height: 20),

            // Project Tools Button
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/dashboard',
                  arguments: widget.project,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Add Project Tools',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Activity Log
            _buildActivityLog(),

            // Add more sections as needed
          ],
        ),
      ),
    );
  }

  Widget _buildProjectOverview() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Overview',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[800],
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 8),
          const Text('Start Date: June 1, 2024', style: TextStyle(fontSize: 14)),
          const Text('End Date: December 15, 2024', style: TextStyle(fontSize: 14)),
          const Text('Status: In Progress', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildActivityLog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activities',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[800],
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 8),
        // Sample activities, replace with real data
        _buildActivityItem('Completed Task: Foundation work.'),
        _buildActivityItem('Added Report: Weekly Progress Report.'),
        _buildActivityItem('Uploaded new blueprint.'),
      ],
    );
  }

  Widget _buildActivityItem(String activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: Colors.blueGrey[800]),
          const SizedBox(width: 8),
          Expanded(child: Text(activity)),
        ],
      ),
    );
  }
}
