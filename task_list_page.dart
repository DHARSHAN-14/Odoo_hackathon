import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  final List<Map<String, String>> sampleTasks = const [
    {'title': 'Design Landing Page', 'assignee': 'Alice', 'due': '2025-09-10', 'status': 'In Progress'},
    {'title': 'Develop REST API', 'assignee': 'Bob', 'due': '2025-09-15', 'status': 'To-Do'},
    {'title': 'Write Unit Tests', 'assignee': 'Charlie', 'due': '2025-09-20', 'status': 'Done'},
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Done':
        return Colors.green;
      case 'In Progress':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: Colors.blue.shade700,
        elevation: 6,
        shadowColor: Colors.blue.shade200,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sampleTasks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final task = sampleTasks[index];
          final statusColor = getStatusColor(task['status']!);

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            shadowColor: statusColor.withOpacity(0.3),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              title: Text(
                task['title']!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade900,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Assigned to ${task['assignee']} • Due: ${task['due']}',
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  task['status']!,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              onTap: () => Navigator.pushNamed(context, '/task_detail'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        tooltip: 'Add New Task',
        child: const Icon(Icons.add, size: 28),
        onPressed: () => Navigator.pushNamed(context, '/task_create_edit'),
      ),
    );
  }
}
