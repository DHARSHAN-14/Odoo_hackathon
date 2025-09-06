import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {
      'title': 'New task assigned',
      'description': 'You have been assigned "Design Landing Page".',
      'time': '2 hours ago',
      'icon': Icons.task_alt,
      'color': Colors.blue,
    },
    {
      'title': 'Project deadline upcoming',
      'description': 'Project Alpha deadline is in 3 days.',
      'time': '1 day ago',
      'icon': Icons.schedule,
      'color': Colors.orange,
    },
    {
      'title': 'New comment',
      'description': 'Alice commented on "Update API spec".',
      'time': '2 days ago',
      'icon': Icons.comment,
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue.shade700,
        elevation: 6,
        shadowColor: Colors.blue.shade200,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            shadowColor: notification['color'].withOpacity(0.3),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: notification['color'].withOpacity(0.2),
                child: Icon(notification['icon'], color: notification['color']),
                radius: 28,
              ),
              title: Text(
                notification['title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  notification['description'],
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ),
              trailing: Text(
                notification['time'],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: () {
                // Add page navigation or detailed view if needed
              },
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
          );
        },
      ),
    );
  }
}
