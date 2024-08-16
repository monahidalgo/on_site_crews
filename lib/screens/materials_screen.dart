import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/materials_provider.dart';
import '../packages/project_material.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materials'),
      ),
      body: Consumer<MaterialsProvider>(
        builder: (context, materialsProvider, child) {
          return ListView.builder(
            itemCount: materialsProvider.materials.length,
            itemBuilder: (context, index) {
              final material = materialsProvider.materials[index];
              return ListTile(
                title: Text(material.name),
                subtitle: Text('Quantity: ${material.quantity}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMaterialDialog(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add), // Use Colors.blue here
      ),
    );
  }

  void _showAddMaterialDialog(BuildContext context) {
    final nameController = TextEditingController();
    final quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Material'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final name = nameController.text;
                final quantity = int.tryParse(quantityController.text) ?? 0;
                if (name.isNotEmpty && quantity > 0) {
                  final material = ProjectMaterial(name: name, quantity: quantity);
                  Provider.of<MaterialsProvider>(context, listen: false).addMaterial(material);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
