import 'package:flutter/material.dart';

class TaskManagementScreen extends StatelessWidget {
  const TaskManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add_task');
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {
                    // Implement voice search
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Filter tabs with a bottom border
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterTab(context, "Open"),
                _buildFilterTab(context, "Completed"),
                _buildFilterTab(context, "All"),
              ],
            ),
          ),
          Divider(color: Colors.grey[400], thickness: 1),
          // Mock tasks list
          Expanded(
            child: ListView(
              children: [
                _buildTaskTile(context, "New Mexico", "2024-12-31", "Mark Dott"),
                _buildTaskTile(context, "California", "2024-11-15", "Jane Dott"),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_task');
        },
        backgroundColor: Colors.blue,
        tooltip: 'Add Task', // Set the background color to blue
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFilterTab(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        // Implement filtering logic
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 2,
            width: 40,
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  Widget _buildTaskTile(BuildContext context, String title, String dueDate, String name) {
    return ListTile(
      leading: const Icon(Icons.task),
      title: Text(title),
      subtitle: Text('Due date: $dueDate'),
      trailing: Text(name, style: const TextStyle(color: Colors.grey)),
    );
  }
}
