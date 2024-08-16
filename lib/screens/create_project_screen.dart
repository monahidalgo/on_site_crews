import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _priority;
  String? _status;
  final List<String> _teamMembers = [];

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  void _addTeamMember(String member) {
    setState(() {
      _teamMembers.add(member);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Project'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Project Name'),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Project Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _startDateController,
              decoration: const InputDecoration(labelText: 'Start Date'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _startDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                  });
                }
              },
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _endDateController,
              decoration: const InputDecoration(labelText: 'End Date'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _endDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                  });
                }
              },
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: _priority,
              decoration: const InputDecoration(labelText: 'Priority'),
              items: ['Low', 'Medium', 'High'].map((String priority) {
                return DropdownMenuItem<String>(
                  value: priority,
                  child: Text(priority),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _priority = newValue;
                });
              },
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: _status,
              decoration: const InputDecoration(labelText: 'Status'),
              items: ['Planned', 'In Progress', 'Completed'].map((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _status = newValue;
                });
              },
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Project Image'),
            ),
            const SizedBox(height: 8.0),
            _image != null
                ? Image.file(File(_image!.path))
                : const Text('No image selected'),
            const SizedBox(height: 16.0),
            const Text('Team Members'),
            Wrap(
              spacing: 8.0,
              children: _teamMembers
                  .map((member) => Chip(
                label: Text(member),
                onDeleted: () {
                  setState(() {
                    _teamMembers.remove(member);
                  });
                },
              ))
                  .toList(),
            ),
            const SizedBox(height: 8.0),
            TextField(
              decoration: const InputDecoration(labelText: 'Add Team Member'),
              onSubmitted: _addTeamMember,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final newProject = {
                  'name': _nameController.text,
                  'description': _descriptionController.text,
                  'startDate': _startDateController.text,
                  'endDate': _endDateController.text,
                  'priority': _priority ?? '',
                  'status': _status ?? '',
                  'teamMembers': _teamMembers.join(', '),
                  'image': _image?.path ?? '',
                };
                Navigator.pop(context, newProject);
              },
              child: const Text('Create Project'),
            ),
          ],
        ),
      ),
    );
  }
}
