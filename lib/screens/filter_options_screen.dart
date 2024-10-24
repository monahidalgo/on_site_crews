import 'package:flutter/material.dart';

class FilterOptionsScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) applyFilters;

  const FilterOptionsScreen({super.key, required this.applyFilters});

  @override
  _FilterOptionsScreenState createState() => _FilterOptionsScreenState();
}

class _FilterOptionsScreenState extends State<FilterOptionsScreen> {
  final Map<String, dynamic> _filterOptions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Date Range',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Start Date',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _filterOptions['startDate'] = value;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'End Date',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _filterOptions['endDate'] = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'all',
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: 'photos',
                  child: Text('Photos'),
                ),
                DropdownMenuItem(
                  value: 'videos',
                  child: Text('Videos'),
                ),
                DropdownMenuItem(
                  value: 'files',
                  child: Text('Files'),
                ),
              ],
              onChanged: (value) {
                _filterOptions['category'] = value;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                widget.applyFilters(_filterOptions);
                Navigator.pop(context);
              },
              child: const Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
