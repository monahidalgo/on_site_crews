import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Profile'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Photos'),
              onTap: () {
                // Handle photos tap
              },
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('Files'),
              onTap: () {
                // Handle files tap
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Crews'),
              onTap: () {
                // Handle crews tap
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Project Reports'),
              onTap: () {
                // Handle project reports tap
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Invoices'),
              onTap: () {
                // Handle invoices tap
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/time_cards');
            },
            child: Card(
              child: Center(
                child: Text('Time-cards'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/gallery');
            },
            child: Card(
              child: Center(
                child: Text('Gallery'),
              ),
            ),
          ),
          // Add more cards as needed
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
            ),
            IconButton(
              icon: Icon(Icons.assignment),
              onPressed: () {
                Navigator.pushNamed(context, '/manage_tasks');
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_project');
        },
        tooltip: 'Create Project',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
