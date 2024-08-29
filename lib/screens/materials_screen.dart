import 'package:flutter/material.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  _MaterialsScreenState createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  final List<String> _materials = ['Wood', 'Concrete', 'Steel', 'Glass'];
  final Set<String> _selectedMaterials = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materials'),
        actions: [
          if (_selectedMaterials.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  '${_selectedMaterials.length} Item${_selectedMaterials.length > 1 ? 's' : ''} Picked',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: _materials.length,
        itemBuilder: (context, index) {
          final material = _materials[index];
          final isSelected = _selectedMaterials.contains(material);
          return ListTile(
            title: Text(material),
            trailing: Icon(
              isSelected ? Icons.check_box : Icons.check_box_outline_blank,
              color: isSelected ? Colors.green : null,
            ),
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedMaterials.remove(material);
                } else {
                  _selectedMaterials.add(material);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, _selectedMaterials); // Return selected materials
        },
        tooltip: 'Done',
        child: const Icon(Icons.done),
      ),
    );
  }
}
