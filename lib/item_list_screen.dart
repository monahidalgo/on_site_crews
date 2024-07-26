import 'package:flutter/material.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: const Center(
        child: Text('Item List Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Item Screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
