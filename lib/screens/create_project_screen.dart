import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Updated CreateProjectScreen with photo at the top
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

  // Handles the creation of the project and returns to ProjectsScreen
  void _createProject() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create the project and navigate back with project details
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

  // Opens options to take a new photo or select from the gallery
  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take New Photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Upload from Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text('Cancel'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  // Handles picking an image from the selected source
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _photo = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create New Project',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section with add/change photo functionality
            GestureDetector(
              onTap: _showImageOptions,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                      image: _photo != null
                          ? DecorationImage(
                        image: FileImage(File(_photo!.path)),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: _photo == null
                        ? const Icon(
                      Icons.add_a_photo,
                      color: Colors.blueGrey,
                      size: 50,
                    )
                        : null,
                  ),
                  if (_photo != null)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: _showImageOptions,
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField('Project Name', (value) => _name = value!,
                          'Please enter a project name'),
                      _buildTextField('Project Number',
                              (value) => _projectNumber = value!, null),
                      _buildTextField('Address', (value) => _address = value!,
                          null),
                      _buildTextField('Phone Number',
                              (value) => _phone = value!, null),
                      _buildTextField('Contact Person Name',
                              (value) => _contactName = value!, null),
                      _buildTextField(
                        'Email',
                            (value) => _email = value!,
                        'Please enter a valid email address',
                        keyboardType: TextInputType.emailAddress,
                      ),
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
                  width: 160, // Adjusted button width for design
                  child: ElevatedButton(
                    onPressed: _createProject,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      textStyle: const TextStyle(fontSize: 16),
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

  // Reusable method to build text fields with validation and saving logic
  Widget _buildTextField(String label, FormFieldSetter<String> onSaved,
      String? validatorMessage,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
      validator: (value) {
        if (validatorMessage != null &&
            (value == null || value.isEmpty || (keyboardType == TextInputType.emailAddress && !value.contains('@')))) {
          return validatorMessage;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
