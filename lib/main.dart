import 'package:flutter/material.dart';
import 'package:on_site_crews/notifications_screen.dart';
import 'package:on_site_crews/time_cards_screen.dart';
import 'gallery_screen.dart';
import 'login_screen.dart';
import 'create_account_screen.dart';
import 'dashboard_screen.dart';
import 'create_project_screen.dart';
import 'task_management_screen.dart';
import 'add_task_screen.dart';
import 'chat_screen.dart';
import 'document_management_screen.dart';
import 'profile_screen.dart';

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
      initialRoute: '/login', // Start with the login screen
      routes: {
        '/login': (context) => LoginScreen(), // Route for the login screen
        '/create_account': (context) => const CreateAccountScreen(),
        '/dashboard': (context) => DashboardScreen(),
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

