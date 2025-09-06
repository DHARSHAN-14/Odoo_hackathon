import 'package:flutter/material.dart';

import 'home_page.dart';
import 'splash_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'dashboard_page.dart';
import 'project_detail_page.dart';
import 'project_create_edit_page.dart';
import 'task_list_page.dart';
import 'task_create_edit_page.dart';
import 'task_detail_page.dart';
import 'project_chat_page.dart';
import 'profile_page.dart';
import 'notifications_page.dart';

void main() {
  runApp(const SynergySphereApp());
}

class SynergySphereApp extends StatelessWidget {
  const SynergySphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SynergySphere',
      debugShowCheckedModeBanner: false,

      // Start at splash page
      initialRoute: '/',

      routes: {
        '/': (context) => const SplashPage(),

        // Auth routes
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),

        // Main app routes
        '/home': (context) => const HomePage(),
        '/dashboard': (context) => const DashboardPage(),
        '/project_detail': (context) => const ProjectDetailPage(),
        '/project_create_edit': (context) => const ProjectCreateEditPage(),
        '/task_list': (context) => const TaskListPage(),
        '/task_create_edit': (context) => const TaskCreateEditPage(),
        '/task_detail': (context) => const TaskDetailPage(),
        '/project_chat': (context) => const ProjectChatPage(),
        '/profile': (context) => const ProfilePage(),
        '/notifications': (context) => const NotificationsPage(),
      },
    );
  }
}
