import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DashboardScreen extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.yellow,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/bkg.png'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mona Hidalgo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Photos'),
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text('Files'),
              onTap: () {
                Navigator.pushNamed(context, '/document_management');
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Crews'),
              onTap: () {
                Navigator.pushNamed(context, '/crews');
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Project Reports'),
              onTap: () {
                Navigator.pushNamed(context, '/project_reports');
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt),
              title: const Text('Invoices'),
              onTap: () {
                Navigator.pushNamed(context, '/invoices');
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Chats'),
              onTap: () {
                Navigator.pushNamed(context, '/project_chat');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Project Tools',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildDashboardCard(
                        context, 'Projects', Icons.business, Colors.red, '/projects'),
                    _buildDashboardCard(
                        context, 'Time-cards', Icons.access_time, Colors.orange, '/time_cards'),
                    _buildDashboardCard(context, 'Gallery', Icons.photo, Colors.green, '/gallery'),
                    _buildDashboardCard(
                        context, 'Tasks', Icons.assignment, Colors.blue, '/task_management'),
                    _buildDashboardCard(context, 'Reports', Icons.report, Colors.purple, '/reports'),
                    _buildDashboardCard(context, 'Invoices', Icons.receipt, Colors.red, '/invoices'),
                    _buildDashboardCard(context, 'Crews', Icons.group, Colors.teal, '/crews'),
                    _buildDashboardCard(
                        context, 'Chats', Icons.chat, Colors.amber, '/project_chat'),
                    _buildDashboardCard(
                        context, 'Equipment', Icons.construction, Colors.blue, '/equipment'),
                    _buildDashboardCard(
                        context, 'Materials', Icons.production_quantity_limits, Colors.pink, '/materials'),
                    _buildDashboardCard(context, 'Items', Icons.list, Colors.teal, '/items'),
                    _buildDashboardCard(
                        context, 'Incidents', Icons.safety_check, Colors.amber, '/incidents'),
                    _buildDashboardCard(
                        context, 'Docs', Icons.document_scanner, Colors.pink, '/document_management'),
                    _buildDashboardCard(
                        context, 'Contacts', Icons.contacts_rounded, Colors.pink, '/contacts'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_project');
        },
        tooltip: 'Create Project',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Icon(icon, size: 50, color: color),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
