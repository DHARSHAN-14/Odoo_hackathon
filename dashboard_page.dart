import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample project list, replace with dynamic data later
    final List<Map<String, String>> projects = [
      {'name': 'Project Alpha', 'summary': 'In Progress · 5 tasks'},
      {'name': 'Project Beta', 'summary': 'Completed · 12 tasks'},
      {'name': 'Project Gamma', 'summary': 'Delayed · 3 tasks'},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Projects', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue.shade700,
        elevation: 6,
        shadowColor: Colors.blue.shade200,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
            onPressed: () => Navigator.pushNamed(context, '/notifications'),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: projects.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final project = projects[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              shadowColor: Colors.blue.shade100,
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                onTap: () => Navigator.pushNamed(context, '/project_detail'),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Text(
                    project['name']![0],
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  radius: 28,
                ),
                title: Text(
                  project['name']!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade900,
                  ),
                ),
                subtitle: Text(
                  project['summary']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.blue.shade700,
                  size: 28,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        tooltip: 'Create New Project',
        child: const Icon(Icons.add, size: 28),
        onPressed: () => Navigator.pushNamed(context, '/project_create_edit'),
      ),
    );
  }
}
