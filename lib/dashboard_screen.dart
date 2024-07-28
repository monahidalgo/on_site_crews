import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On-Site Crews'),
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
                      fontSize: 18,
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
                Navigator.pushNamed(context, '/photos');
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text('Files'),
              onTap: () {
                Navigator.pushNamed(context, '/files');
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
                Navigator.pushNamed(context, '/chats');
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
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildDashboardCard(context, 'Projects', Icons.business, Colors.red, '/projects'),
                  _buildDashboardCard(context, 'Time-cards', Icons.access_time, Colors.orange, '/time_cards'),
                  _buildDashboardCard(context, 'Photos', Icons.photo, Colors.green, '/photos'),
                  _buildDashboardCard(context, 'Tasks', Icons.assignment, Colors.blue, '/tasks'),
                  _buildDashboardCard(context, 'Reports', Icons.report, Colors.purple, '/reports'),
                  _buildDashboardCard(context, 'Invoices', Icons.receipt, Colors.red, '/invoices'),
                  _buildDashboardCard(context, 'Crews', Icons.group, Colors.teal, '/crews'),
                  _buildDashboardCard(context, 'Chats', Icons.chat, Colors.amber, '/chats'),
                  _buildDashboardCard(context, 'Equipment', Icons.construction, Colors.blue, '/equipment'),
                  _buildDashboardCard(context, 'Materials', Icons.production_quantity_limits, Colors.pink, '/materials'),
                  _buildDashboardCard(context, 'Items', Icons.list, Colors.teal, '/items'),
                  _buildDashboardCard(context, 'Incidents', Icons.safety_check, Colors.amber, '/incidents'),
                  _buildDashboardCard(context, 'Docs', Icons.document_scanner, Colors.pink, '/docs'),
                  _buildDashboardCard(context, 'Contacts', Icons.contacts_rounded, Colors.pink, '/contacts'),
                ],
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
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon, Color color, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
