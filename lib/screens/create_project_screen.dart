import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For picking images

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _projectNumber = '';
  String _address = '';
  String _phone = '';
  String _contactName = '';
  String _email = '';
  XFile? _photo;

  final ImagePicker _picker = ImagePicker();

  void _createProject() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Save project data here
      Navigator.pop(context, {
        'name': _name,
        'projectNumber': _projectNumber,
        'address': _address,
        'phone': _phone,
        'contactName': _contactName,
        'email': _email,
        'photoPath': _photo?.path,
      });
    }
  }

  Future<void> _selectPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _photo = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Project'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Project Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a project name';
                          }
                          return null;
                        },
                        onSaved: (value) => _name = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Project Number'),
                        onSaved: (value) => _projectNumber = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Address'),
                        onSaved: (value) => _address = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Phone Number'),
                        onSaved: (value) => _phone = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Contact Person Name'),
                        onSaved: (value) => _contactName = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value!,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _selectPhoto,
                        child: const Text('Add Photo'),
                      ),
                      if (_photo != null) ...[
                        const SizedBox(height: 16),
                        Image.file(
                          File(_photo!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: SizedBox(
                  width: 200, // Adjust width here
                  child: ElevatedButton(
                    onPressed: _createProject,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue, // Set text color to white
                      padding: const EdgeInsets.symmetric(vertical: 16.0), // Increase button height
                      textStyle: const TextStyle(fontSize: 18), // Increase font size
                    ),
                    child: const Text('Create Project'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

