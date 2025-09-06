import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data
    final projectName = "Project Alpha";
    final projectDescription = "A cutting-edge project aiming to improve team collaboration efficiency.";
    final List<Map<String, Object>> members = [
      {'name': 'Alice', 'avatarColor': Colors.blue},
      {'name': 'Bob', 'avatarColor': Colors.green},
      {'name': 'Charlie', 'avatarColor': Colors.orange},
      {'name': 'Diana', 'avatarColor': Colors.purple},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(projectName),
        backgroundColor: Colors.blue.shade700,
        elevation: 6,
        shadowColor: Colors.blue.shade200,
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            tooltip: 'Project Chat',
            onPressed: () => Navigator.pushNamed(context, '/project_chat'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectName,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      projectDescription,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Team Members",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 12,
                      runSpacing: 12,
                      children: members
                          .map((member) {
                            final name = member['name'] as String? ?? '';
                            return CircleAvatar(
                              radius: 24,
                              backgroundColor: member['avatarColor'] as Color,
                              child: Text(
                                name.isNotEmpty ? name[0] : '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          })
                          .toList(),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.list_alt),
                        label: const Text('View Task Board', style: TextStyle(fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/task_list'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
