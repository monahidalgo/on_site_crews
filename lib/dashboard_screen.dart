import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Tools'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                  SizedBox(height: 10),
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
              leading: Icon(Icons.photo),
              title: Text('Photos'),
              onTap: () {
                Navigator.pushNamed(context, '/photos');
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_file),
              title: Text('Files'),
              onTap: () {
                Navigator.pushNamed(context, '/files');
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Crews'),
              onTap: () {
                Navigator.pushNamed(context, '/crews');
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Project Reports'),
              onTap: () {
                Navigator.pushNamed(context, '/project_reports');
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Invoices'),
              onTap: () {
                Navigator.pushNamed(context, '/invoices');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project Tools',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildDashboardBox(context, 'Time-cards', Icons.access_time, Colors.orange, '/time_cards'),
                  _buildDashboardBox(context, 'Gallery', Icons.photo, Colors.green, '/gallery'),
                  _buildDashboardBox(context, 'Tasks', Icons.assignment, Colors.blue, '/tasks'),
                  _buildDashboardBox(context, 'Reports', Icons.report, Colors.purple, '/reports'),
                  _buildDashboardBox(context, 'Invoices', Icons.receipt, Colors.red, '/invoices'),
                  _buildDashboardBox(context, 'Crews', Icons.group, Colors.teal, '/crews'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardBox(BuildContext context, String title, IconData icon, Color color, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

