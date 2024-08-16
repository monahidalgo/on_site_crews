import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<dynamic> yourDataSource = []; // Replace with your actual data source
  String selectedTab = 'All';

  @override
  void initState() {
    super.initState();
    // Initialize your data source here
    // Example: yourDataSource = fetchDataFromDatabase();
    yourDataSource = [
      {'type': 'photo', 'data': 'Photo 1'},
      {'type': 'video', 'data': 'Video 1'},
      {'type': 'file', 'data': 'File 1'},
    ];
  }

  List<dynamic> getFilteredData() {
    if (selectedTab == 'All') {
      return yourDataSource;
    } else {
      return yourDataSource.where((item) => item['type'] == selectedTab.toLowerCase()).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredData = getFilteredData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.filter_list),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {
                    // Handle voice search functionality
                  },
                ),
                border: const OutlineInputBorder(),
              ),
              onTap: () {
                // Navigate to the FilterOptionsScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterOptionsScreen(
                      applyFilters: (filterOptions) {
                        // Implement your filter logic here
                        setState(() {
                          // Update the selectedTab or any other filter criteria
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GalleryTab(
                label: 'All',
                isSelected: selectedTab == 'All',
                onTap: () {
                  setState(() {
                    selectedTab = 'All';
                  });
                },
              ),
              GalleryTab(
                label: 'Photos',
                isSelected: selectedTab == 'Photos',
                onTap: () {
                  setState(() {
                    selectedTab = 'Photos';
                  });
                },
              ),
              GalleryTab(
                label: 'Videos',
                isSelected: selectedTab == 'Videos',
                onTap: () {
                  setState(() {
                    selectedTab = 'Videos';
                  });
                },
              ),
              GalleryTab(
                label: 'Files',
                isSelected: selectedTab == 'Files',
                onTap: () {
                  setState(() {
                    selectedTab = 'Files';
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: filteredData.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    selectedTab == 'Photos'
                        ? Icons.photo_library
                        : selectedTab == 'Videos'
                        ? Icons.videocam
                        : selectedTab == 'Files'
                        ? Icons.insert_drive_file
                        : Icons.photo_library,
                    size: 80.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    selectedTab == 'Photos'
                        ? 'No Photos'
                        : selectedTab == 'Videos'
                        ? 'No Videos'
                        : selectedTab == 'Files'
                        ? 'No Files'
                        : 'No Items',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Your gallery is empty',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                var item = filteredData[index];
                return ListTile(
                  leading: Icon(
                    item['type'] == 'photo'
                        ? Icons.photo
                        : item['type'] == 'video'
                        ? Icons.videocam
                        : Icons.insert_drive_file,
                  ),
                  title: Text(item['data']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GalleryTab({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4.0),
          Container(
            height: 2.0,
            width: 40.0,
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

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
