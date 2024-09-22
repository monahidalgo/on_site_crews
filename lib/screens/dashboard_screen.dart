import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();
  final Map<String, String>? project;

  DashboardScreen({super.key, this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' ${project?['name'] ?? 'Project Tools'}',
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20, // Adjusted to keep consistent with other screens
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blueGrey, // Updated color to match the theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tools',
              style: TextStyle(
                fontSize: 20, // Adjusted to match the other screens
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey, // Updated to match theme colors
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardCard(context, 'Projects', Icons.business,
                      Colors.blueGrey[700]!, '/projects'),
                  _buildDashboardCard(context, 'Time-cards', Icons.access_time,
                      Colors.blueGrey[600]!, '/time_cards'),
                  _buildDashboardCard(
                      context, 'Gallery', Icons.photo, Colors.teal, '/gallery'),
                  _buildDashboardCard(context, 'Tasks', Icons.assignment,
                      Colors.blueGrey[500]!, '/task_management'),
                  _buildDashboardCard(context, 'Reports', Icons.report,
                      Colors.blueGrey[400]!, '/reports'),
                  _buildDashboardCard(context, 'Invoices', Icons.receipt,
                      Colors.redAccent, '/invoices'),
                  _buildDashboardCard(context, 'Crews', Icons.group,
                      Colors.teal[700]!, '/crew_management'),
                  _buildDashboardCard(
                      context,
                      'Chats',
                      Icons.chat_bubble_outline,
                      Colors.blueAccent,
                      '/project_chat'),
                  _buildDashboardCard(context, 'Equipment', Icons.construction,
                      Colors.grey[700]!, '/equipment'),
                  _buildDashboardCard(
                      context,
                      'Materials',
                      Icons.build_circle_outlined,
                      Colors.pinkAccent,
                      '/materials'),
                  _buildDashboardCard(context, 'Items',
                      Icons.format_list_bulleted, Colors.teal[500]!, '/items'),
                  _buildDashboardCard(
                      context,
                      'Incidents',
                      Icons.warning_amber_rounded,
                      Colors.orangeAccent,
                      '/incidents'),
                  _buildDashboardCard(context, 'Docs', Icons.document_scanner,
                      Colors.purpleAccent, '/document_management'),
                  _buildDashboardCard(context, 'Contacts', Icons.contacts,
                      Colors.indigo, '/contacts'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon,
      Color color, String route) {
    return GestureDetector(
      onTap: () {
        audioPlayer.play(AssetSource('assets/sounds/buttonclick-1.wav'));
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color), // Updated size for consistency
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
