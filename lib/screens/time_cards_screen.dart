import 'package:flutter/material.dart';
import 'dart:async';

class TimeCardsScreen extends StatefulWidget {
  const TimeCardsScreen({super.key});

  @override
  _TimeCardsScreenState createState() => _TimeCardsScreenState();
}

class _TimeCardsScreenState extends State<TimeCardsScreen> {
  final Color _backgroundColor = Colors.grey[400]!;
  final List<Map<String, dynamic>> timeCards = [
    {
      'date': '08/29/2024',
      'hours': '8:00 - 16:00',
      'break': '1 hour',
      'totalHours': '7 hours',
      'project': 'Sherman Oaks Mall',
      'task': 'Interior Painting',
      'isRunning': false,
      'elapsedTime': const Duration(),
      'timer': null,
    },
    {
      'date': '08/28/2024',
      'hours': '9:00 - 17:00',
      'break': '30 mins',
      'totalHours': '7.5 hours',
      'project': 'Bilt Soft',
      'task': 'Roof Inspection',
      'isRunning': false,
      'elapsedTime': const Duration(),
      'timer': null,
    },
    // Add more time card data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Time Cards',
          style: TextStyle(fontFamily: 'Roboto'),
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
        color: _backgroundColor,
        child: ListView.builder(
          itemCount: timeCards.length,
          itemBuilder: (context, index) {
            final timeCard = timeCards[index];
            final color = _getProjectColor(timeCard['project']);

            return GestureDetector(
              onTap: () {
                // Add logic to view/edit details of the time card
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(12.0),
                      leading: CircleAvatar(
                        backgroundColor: color,
                        child: Text(
                          timeCard['project'][0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      title: Text(
                        timeCard['project'],
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: ${timeCard['date']}'),
                          Text('Task: ${timeCard['task']}'),
                          Text('Worked Hours: ${timeCard['hours']}'),
                          Text('Break Time: ${timeCard['break']}'),
                          Text(
                            'Total: ${timeCard['totalHours']}',
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blueGrey),
                        onPressed: () {
                          // Logic to edit the time card details
                        },
                      ),
                    ),
                    _buildTimerSection(timeCard, index),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateTimeCardDialog();
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildTimerSection(Map<String, dynamic> timeCard, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _formatDuration(timeCard['elapsedTime']),
            style: const TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  timeCard['isRunning'] ? Icons.pause : Icons.play_arrow,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    if (timeCard['isRunning']) {
                      timeCard['isRunning'] = false;
                      timeCard['timer']?.cancel();
                    } else {
                      timeCard['isRunning'] = true;
                      timeCard['timer'] = Timer.periodic(const Duration(seconds: 1), (timer) {
                        setState(() {
                          timeCard['elapsedTime'] = timeCard['elapsedTime']! + const Duration(seconds: 1);
                        });
                      });
                    }
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop, color: Colors.red),
                onPressed: () {
                  setState(() {
                    timeCard['isRunning'] = false;
                    timeCard['timer']?.cancel();
                    timeCard['elapsedTime'] = const Duration();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  void _showCreateTimeCardDialog() {
    final projectController = TextEditingController();
    final taskController = TextEditingController();
    final dateController = TextEditingController();
    final hoursController = TextEditingController();
    final breakController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create Time Card'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: projectController,
                decoration: const InputDecoration(labelText: 'Project Name'),
              ),
              TextField(
                controller: taskController,
                decoration: const InputDecoration(labelText: 'Task'),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Date (MM/DD/YYYY)'),
              ),
              TextField(
                controller: hoursController,
                decoration: const InputDecoration(labelText: 'Worked Hours'),
              ),
              TextField(
                controller: breakController,
                decoration: const InputDecoration(labelText: 'Break Time'),
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
                setState(() {
                  timeCards.add({
                    'date': dateController.text,
                    'hours': hoursController.text,
                    'break': breakController.text,
                    'totalHours': '0 hours', // Placeholder, update as needed
                    'project': projectController.text,
                    'task': taskController.text,
                    'isRunning': false,
                    'elapsedTime': const Duration(),
                    'timer': null,
                  });
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomAppBar() {
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

  Color _getProjectColor(String projectName) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.cyan,
      Colors.amber,
    ];
    return colors[projectName.codeUnitAt(0) % colors.length];
  }
}
