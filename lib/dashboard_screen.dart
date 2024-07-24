import 'package:flutter/material.dart';
import 'create_project_screen.dart';
import 'contractor_management_screen.dart';
import 'owner_management_screen.dart';
import 'employee_management_screen.dart';
import 'crew_management_screen.dart';
import 'item_list_screen.dart';
import 'login_screen.dart';
import 'profile_screen.dart';

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
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_image.png'), // Placeholder for profile image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'user@example.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Manage Projects'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateProjectScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Manage Contractors'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContractorManagementScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Manage Owners'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OwnerManagementScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Manage Employees'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeManagementScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Manage Crews'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CrewManagementScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Item List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemListScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
