import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Map<String, String>? project;

  const ProjectDetailsScreen({super.key, this.project});

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  bool isOverviewExpanded = false;

  get extraContent => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.project?['name'] ?? 'Project Details',
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20, // Matching dashboard font size
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.orange[900], // Matching dashboard color
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
            // Project Overview Section (Expandable)
            _buildExpandableCard(
              title: 'Project Overview',
              icon: Icons.description,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start Date: June 1, 2024'),
                  Text('End Date: December 15, 2024'),
                  Text('Status: In Progress'),
                  SizedBox(height: 10),
                  // Progress Bar
                  Text('Completion:'),
                  LinearProgressIndicator(value: 0.6), // 60% complete
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Notes Section
            _buildClickableCard(
              title: 'Project Notes',
              icon: Icons.note_alt,
              onTap: () {
                Navigator.pushNamed(context, '/notes',
                    arguments: widget.project);
              },
            ),
            const SizedBox(height: 20),

            // File Upload Section
            _buildClickableCard(
              title: 'File Uploads',
              icon: Icons.upload_file,
              onTap: () {
                // Implement file upload logic
              },
            ),
            const SizedBox(height: 20),

            // Recent Activity Log
            _buildActivityLog(),
          ],
        ),
      ),

      // Floating Action Button for Add Project Tools
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/dashboard', arguments: widget.project);
        },
        label: const Text('Add Project Tools'),
        icon: const Icon(Icons.build),
        backgroundColor: Colors.blueGrey, // Consistent with dashboard theme
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
      child: _buildCard(
        title: title,
        icon: icon,
        content: extraContent,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: Colors.blueGrey), // Same icon color
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16, // Matching dashboard card text
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  color: Colors.blueGrey, // Matching color scheme
                ),
              ),
              const Spacer(),
              if (content != null && !isExpanded)
                const Icon(Icons.keyboard_arrow_down),
              if (content != null && isExpanded)
                const Icon(Icons.keyboard_arrow_up),
            ],
          ),
          if (content != null) const SizedBox(height: 8),
          if (content != null && (isExpanded || extraContent != null)) content,
        ],
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
            fontSize: 18, // Matching dashboard font size
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey, // Matching color scheme
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
          const Icon(Icons.check_circle_outline, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Expanded(child: Text(activity)),
        ],
      ),
    );
  }
}
