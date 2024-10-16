import 'package:flutter/material.dart';
import 'package:on_site_crews/providers/materials_provider.dart';
import 'package:on_site_crews/screens/NotesScreen.dart';
import 'package:on_site_crews/screens/add_task_screen.dart';
import 'package:on_site_crews/screens/chat_screen.dart';
import 'package:on_site_crews/screens/create_account_screen.dart';
import 'package:on_site_crews/screens/create_project_screen.dart';
import 'package:on_site_crews/screens/crew_management_screen.dart';
import 'package:on_site_crews/screens/dashboard_screen.dart';
import 'package:on_site_crews/screens/document_management_screen.dart';
import 'package:on_site_crews/screens/employee_management_screen.dart';
import 'package:on_site_crews/screens/gallery_screen.dart';
import 'package:on_site_crews/screens/gettingstarted.dart';
import 'package:on_site_crews/screens/login_screen.dart';
import 'package:on_site_crews/screens/materials_screen.dart';
import 'package:on_site_crews/screens/notifications_screen.dart';
import 'package:on_site_crews/screens/profile_screen.dart';
import 'package:on_site_crews/screens/project_detail_screen.dart';
import 'package:on_site_crews/screens/projects_screen.dart';
import 'package:on_site_crews/screens/task_management_screen.dart';
import 'package:on_site_crews/screens/time_cards_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MaterialsProvider()),
        // Add other providers here...
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Construction Site Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Start with the Getting Started screen
      routes: {
        '/': (context) =>
            const GettingStartedScreen(), // Getting Started Screen
        '/login': (context) => LoginScreen(),
        '/create_account': (context) => const CreateAccountScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/create_project': (context) => const CreateProjectScreen(),
        '/task_management': (context) => const TaskManagementScreen(),
        '/add_task': (context) => const AddTaskScreen(),
        '/project_chat': (context) => const ChatScreen(),
        '/document_management': (context) => const DocumentManagementScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/time_cards': (context) => const TimeCardsScreen(),
        '/gallery': (context) => const GalleryScreen(),
        '/projects': (context) => const ProjectsScreen(),
        '/materials': (context) => const MaterialsScreen(),
        '/crew_management': (context) => const CrewManagementScreen(),
        '/notes': (context) => const NotesScreen(),
        '/employee_management': (context) => const EmployeeManagementScreen(),
        '/project_detail': (context) => ProjectDetailsScreen(
              project: ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?,
            ),
      },
    );
  }
}
