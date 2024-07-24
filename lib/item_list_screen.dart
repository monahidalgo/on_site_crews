import 'package:flutter/material.dart';

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Center(
        child: Text('Item List Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Item Screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
