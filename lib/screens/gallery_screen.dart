import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gallery',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Container(
        color: Colors.grey[400],
        child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 20, // Number of items
          itemBuilder: (context, index) {
            // Determine image based on index
            String imagePath = index == 0
                ? 'assets/images/on.png' // Image for the first item
                : 'assets/images/onsite.jpeg'; // Image for other items

            return GestureDetector(
              onTap: () {
                // Add logic to view item details
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Item ${index + 1}', // Text for each item
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showUploadDialog(context);
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  void _showUploadDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Upload New Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add upload logic here
                Navigator.pop(context);
              },
              child: const Text('Upload'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.grey[850],
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildBottomNavIcon(
              icon: Icons.home,
              label: 'Home',
              color: Colors.white,
              onTap: () {
                // Add navigation logic for Home
              },
            ),
            _buildBottomNavIcon(
              icon: Icons.assignment,
              label: 'Activity',
              color: Colors.white,
              onTap: () {
                // Add navigation logic for Activity
              },
            ),
            _buildBottomNavIcon(
              icon: Icons.chat,
              label: 'Chat',
              color: Colors.white,
              onTap: () {
                // Add navigation logic for Chat
              },
            ),
            _buildBottomNavIcon(
              icon: Icons.account_circle_outlined,
              label: 'Account',
              color: Colors.white,
              onTap: () {
                // Add navigation logic for Account
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavIcon({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            label,
            style: TextStyle(color: color, fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }
}
