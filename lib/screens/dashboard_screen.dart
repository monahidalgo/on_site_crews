import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DashboardScreen extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();
  final Map<String, String>? project;

  DashboardScreen({super.key, this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard - ${project?['name'] ?? 'Project Tools'}'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Project Tools',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto', // Using Roboto font
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardCard(
                      context, 'Projects', Icons.business, Colors.blue, '/projects'),
                  _buildDashboardCard(
                      context, 'Time-cards', Icons.access_time, Colors.red, '/time_cards'),
                  _buildDashboardCard(
                      context, 'Gallery', Icons.photo, Colors.green, '/gallery'),
                  _buildDashboardCard(
                      context, 'Tasks', Icons.assignment, Colors.blue, '/task_management'),
                  _buildDashboardCard(
                      context, 'Reports', Icons.report, Colors.blue, '/reports'),
                  _buildDashboardCard(
                      context, 'Invoices', Icons.receipt, Colors.red, '/invoices'),
                  _buildDashboardCard(
                      context, 'Crews', Icons.group, Colors.teal, '/crew_management'),
                  _buildDashboardCard(
                      context, 'Chats', Icons.chat, Colors.amber, '/project_chat'),
                  _buildDashboardCard(
                      context, 'Equipment', Icons.construction, Colors.blue, '/equipment'),
                  _buildDashboardCard(
                      context, 'Materials', Icons.build, Colors.pink, '/materials'),
                  _buildDashboardCard(
                      context, 'Items', Icons.list, Colors.teal, '/items'),
                  _buildDashboardCard(
                      context, 'Incidents', Icons.warning, Colors.amber, '/incidents'),
                  _buildDashboardCard(
                      context, 'Docs', Icons.document_scanner, Colors.pink, '/document_management'),
                  _buildDashboardCard(
                      context, 'Contacts', Icons.contacts, Colors.pink, '/contacts'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back to ProjectDetailsScreen
        },
        tooltip: 'Back to Project Details',
        backgroundColor: Colors.orange,
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon, Color color, String route) {
    return GestureDetector(
      onTap: () {
        audioPlayer.play(AssetSource('assets/sounds/buttonclick-1.wav'));
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto', // Using Roboto font
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
