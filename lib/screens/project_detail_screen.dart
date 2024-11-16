import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Map<String, String>? project;

  const ProjectDetailsScreen({super.key, this.project});

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  bool isOverviewExpanded = false;
  int timeCardCount = 3; // Badge count for time cards
  int galleryCount = 7; // Badge count for gallery
  int reportCount = 2; // Badge count for reports

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.project?['name'] ?? 'Project Details',
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
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
        child: ListView(
          children: [
            _buildExpandableCard(
              title: 'Project Overview',
              icon: Icons.description,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start Date: June 1, 2024'),
                  Text('End Date: December 15, 2024'),
                  Text('Status: In Progress'),
                  const SizedBox(height: 10),
                  Text('Completion:'),
                  LinearProgressIndicator(value: 0.6),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Project Notes Section
            _buildClickableCard(
              title: 'Project Notes',
              icon: Icons.note_alt,
              onTap: () {
                Navigator.pushNamed(context, '/notes',
                    arguments: widget.project);
              },
            ),
            const SizedBox(height: 20),

            // Project Tools Section with Badge for Time Cards, Gallery, and Reports
            _buildClickableCard(
              title: 'Add Project Tools',
              icon: Icons.file_open_outlined,
              onTap: () {
                Navigator.pushNamed(context, '/dashboard',
                    arguments: widget.project);
              },
              extraContent: _buildBadges(),
            ),
            const SizedBox(height: 20),

            _buildActivityLog(),
          ],
        ),
      ),

      // Floating Action Button to add time card
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            timeCardCount++;
          });
        },
        backgroundColor: Colors.blueGrey[100],
        child: const Icon(Icons.access_alarm),
      ),
    );
  }

  Widget _buildExpandableCard({
    required String title,
    required IconData icon,
    required Widget content,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOverviewExpanded = !isOverviewExpanded;
        });
      },
      child: _buildCard(
        title: title,
        icon: icon,
        content: content,
        isExpanded: isOverviewExpanded,
      ),
    );
  }

  Widget _buildClickableCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Widget? extraContent,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          _buildCard(
            title: title,
            icon: icon,
            content: null, // No content by default
          ),
          if (extraContent != null)
            Positioned(
              right: 16, // Adjust this to position the badges correctly
              top: 16,
              child: extraContent,
            ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    Widget? content,
    bool isExpanded = false,
  }) {
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
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: Colors.orange),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.blueGrey,
                ),
              ),
              const Spacer(),
              if (content != null && !isExpanded)
                const Icon(Icons.keyboard_arrow_down),
              if (content != null && isExpanded)
                const Icon(Icons.keyboard_arrow_up),
            ],
          ),
          if (content != null && isExpanded) ...[
            const SizedBox(height: 8),
            content,
          ],
        ],
      ),
    );
  }

  Widget _buildBadges() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildBadge(timeCardCount, Colors.red),
        const SizedBox(width: 8),
        _buildBadge(galleryCount, Colors.green),
        const SizedBox(width: 8),
        _buildBadge(reportCount, Colors.blue),
      ],
    );
  }

  Widget _buildBadge(int count, Color color) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color,
      child: Text(
        '$count',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildActivityLog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activities',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 8),
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
          const Icon(Icons.check_circle_outline, color: Colors.orange),
          const SizedBox(width: 8),
          Expanded(child: Text(activity)),
        ],
      ),
    );
  }
}
