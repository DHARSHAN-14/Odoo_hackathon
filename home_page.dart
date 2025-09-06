import 'package:flutter/material.dart';
import 'project_create_edit_page.dart'; // Make sure the path is correct

class HomePage extends StatefulWidget {
  final bool isAdmin;
  final String userRole;

  const HomePage({super.key, this.isAdmin = false, this.userRole = 'Frontend'});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Map<String, dynamic>> projects;
  final String currentUserName = 'john.doe'; // Replace with actual user info

  @override
  void initState() {
    super.initState();
    projects = [
      {
        'company': 'Tech Solutions',
        'projectName': 'SynergySphere',
        'description': 'An advanced team collaboration app.',
        'projectLead': 'Alice Johnson',
        'startDate': DateTime(2025, 1, 1),
        'endDate': DateTime(2025, 12, 31),
        'mainGroup': 'SynergySphere',
        'subGroups': [
          {'name': 'Backend', 'members': []},
          {'name': 'Frontend', 'members': []},
          {'name': 'HR', 'members': []},
        ],
        'joinRequests': <String>[],
      }
    ];
  }

  void _navigateToCreateProject() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProjectCreateEditPage()),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        projects.add({
          'company': 'New Company',
          'projectName': result['name'] ?? 'Unnamed Project',
          'description': result['description'] ?? '',
          'projectLead': 'Lead Name',
          'startDate': DateTime.now(),
          'endDate': DateTime.now().add(const Duration(days: 30)),
          'mainGroup': result['name'] ?? 'Unnamed Project',
          'subGroups': [
            {'name': 'Backend', 'members': []},
            {'name': 'Frontend', 'members': []},
            {'name': 'HR', 'members': []},
          ],
          'joinRequests': <String>[],
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects & Groups'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            color: Colors.blue.shade100,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: _navigateToCreateProject,
              child: SizedBox(
                height: 120,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_box_rounded, size: 44, color: Colors.blue),
                      SizedBox(height: 8),
                      Text(
                        'Create New Project',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Existing projects listing below...
          ...projects.map((project) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ExpansionTile(
                title: Text(
                  project['projectName'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text("Company: ${project['company']}"),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(project['description']),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text("Project Lead: ${project['projectLead']}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: (project['subGroups'] as List)
                          .map<Widget>((sg) => Chip(
                                label: Text(sg['name']),
                                avatar: const Icon(Icons.group),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
