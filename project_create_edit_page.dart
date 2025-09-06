import 'package:flutter/material.dart';

class ProjectCreateEditPage extends StatefulWidget {
  final String? projectName;
  final String? projectDescription;

  const ProjectCreateEditPage({super.key, this.projectName, this.projectDescription});

  @override
  _ProjectCreateEditPageState createState() => _ProjectCreateEditPageState();
}

class _ProjectCreateEditPageState extends State<ProjectCreateEditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _teamController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.projectName ?? '');
    _descController = TextEditingController(text: widget.projectDescription ?? '');
    _teamController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _teamController.dispose();
    super.dispose();
  }

  void _saveProject() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String description = _descController.text;
      String teamMembers = _teamController.text;

      Navigator.pop(context, {
        'name': name,
        'description': description,
        'teamMembers': teamMembers,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = widget.projectName != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Project' : 'Create Project'),
        backgroundColor: Colors.blue.shade700,
        elevation: 6,
        shadowColor: Colors.blue.shade200,
        actions: [
          TextButton(
            onPressed: _saveProject,
            child: const Text('Save', style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Project Name',
                      prefixIcon: const Icon(Icons.post_add),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty) ? 'Please enter project name' : null,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _descController,
                    decoration: InputDecoration(
                      labelText: 'Project Description',
                      prefixIcon: const Icon(Icons.description),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _teamController,
                    decoration: InputDecoration(
                      labelText: 'Assign Team Members (comma separated emails/names)',
                      prefixIcon: const Icon(Icons.group),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
