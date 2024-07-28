import 'package:flutter/material.dart';
import 'package:on_site_crews/notifications_screen.dart';
import 'package:on_site_crews/time_cards_screen.dart';
import 'package:on_site_crews/gallery_screen.dart';
import 'package:on_site_crews/login_screen.dart';
import 'package:on_site_crews/create_account_screen.dart';
import 'package:on_site_crews/dashboard_screen.dart';
import 'package:on_site_crews/create_project_screen.dart';
import 'package:on_site_crews/task_management_screen.dart';
import 'package:on_site_crews/add_task_screen.dart';
import 'package:on_site_crews/chat_screen.dart';
import 'package:on_site_crews/document_management_screen.dart';
import 'package:on_site_crews/profile_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Construction Site Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Start with the login screen
      routes: {
        '/login': (context) => LoginScreen(), // Route for the login screen
        '/create_account': (context) => const CreateAccountScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/create_project': (context) => const CreateProjectScreen(),
        '/manage_tasks': (context) => const TaskManagementScreen(),
        '/add_task': (context) => const AddTaskScreen(),
        '/project_chat': (context) => const ChatScreen(),
        '/document_management': (context) => const DocumentManagementScreen(),
        '/notifications_screen': (context) => const NotificationsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/time_cards': (context) => const TimeCardsScreen(),
        '/gallery': (context) => const GalleryScreen(),
      },
    );
  }
}
