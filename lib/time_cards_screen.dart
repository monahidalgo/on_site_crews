import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class TimeCardsScreen extends StatelessWidget {
  const TimeCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Cards'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeeklyTimeCardsScreen()),
                );
              },
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.blue),
                      const SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Weekly Time-cards',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Monday - Friday',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '08:00 AM - 05:00 PM',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthlyTimeCardsScreen()),
                );
              },
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_view_month, color: Colors.blue),
                      const SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monthly Time-cards',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Last day of the month',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '08:00 AM - 05:00 PM',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                'Full Time-cards Feature Coming Soon!',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeeklyTimeCardsScreen extends StatefulWidget {
  @override
  _WeeklyTimeCardsScreenState createState() => _WeeklyTimeCardsScreenState();
}

class _WeeklyTimeCardsScreenState extends State<WeeklyTimeCardsScreen> {
  DateTime? _clockInTime;
  DateTime? _clockOutTime;
  Position? _clockInPosition;
  Position? _clockOutPosition;
  StreamSubscription<Position>? _positionStream;
  Timer? _timer;
  int _elapsedSeconds = 0;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _startTimer() {
    _elapsedSeconds = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _clockIn() async {
    Position position = await _getCurrentLocation();
    setState(() {
      _clockInTime = DateTime.now();
      _clockInPosition = position;
      _startTimer();
    });

    _positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      setState(() {
        _clockInPosition = position;
      });
    });
  }

  void _clockOut() async {
    Position position = await _getCurrentLocation();
    setState(() {
      _clockOutTime = DateTime.now();
      _clockOutPosition = position;
      _stopTimer();
    });

    _positionStream?.cancel();
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    _timer?.cancel();
    super.dispose();
  }

  String _formatElapsedTime() {
    int hours = _elapsedSeconds ~/ 3600;
    int minutes = (_elapsedSeconds % 3600) ~/ 60;
    int seconds = _elapsedSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Time-cards'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _clockIn,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
              child: Text('Clock In'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _clockOut,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
              child: Text('Clock Out'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _clockInTime == null
                  ? 'Not Clocked In'
                  : 'Clocked In: ${_clockInTime.toString()} at (${_clockInPosition?.latitude}, ${_clockInPosition?.longitude})',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              _clockOutTime == null
                  ? 'Not Clocked Out'
                  : 'Clocked Out: ${_clockOutTime.toString()} at (${_clockOutPosition?.latitude}, ${_clockOutPosition?.longitude})',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            if (_clockInTime != null && _clockOutTime == null)
              Text(
                'Elapsed Time: ${_formatElapsedTime()}',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

class MonthlyTimeCardsScreen extends StatefulWidget {
  @override
  _MonthlyTimeCardsScreenState createState() => _MonthlyTimeCardsScreenState();
}

class _MonthlyTimeCardsScreenState extends State<MonthlyTimeCardsScreen> {
  DateTime? _clockInTime;
  DateTime? _clockOutTime;
  Position? _clockInPosition;
  Position? _clockOutPosition;
  StreamSubscription<Position>? _positionStream;
  Timer? _timer;
  int _elapsedSeconds = 0;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _startTimer() {
    _elapsedSeconds = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _clockIn() async {
    Position position = await _getCurrentLocation();
    setState(() {
      _clockInTime = DateTime.now();
      _clockInPosition = position;
      _startTimer();
    });

    _positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      setState(() {
        _clockInPosition = position;
      });
    });
  }

  void _clockOut() async {
    Position position = await _getCurrentLocation();
    setState(() {
      _clockOutTime = DateTime.now();
      _clockOutPosition = position;
      _stopTimer();
    });

    _positionStream?.cancel();
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    _timer?.cancel();
    super.dispose();
  }

  String _formatElapsedTime() {
    int hours = _elapsedSeconds ~/ 3600;
    int minutes = (_elapsedSeconds % 3600) ~/ 60;
    int seconds = _elapsedSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Time-cards'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _clockIn,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
              child: Text('Clock In'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _clockOut,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
              child: Text('Clock Out'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _clockInTime == null
                  ? 'Not Clocked In'
                  : 'Clocked In: ${_clockInTime.toString()} at (${_clockInPosition?.latitude}, ${_clockInPosition?.longitude})',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              _clockOutTime == null
                  ? 'Not Clocked Out'
                  : 'Clocked Out: ${_clockOutTime.toString()} at (${_clockOutPosition?.latitude}, ${_clockOutPosition?.longitude})',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            if (_clockInTime != null && _clockOutTime == null)
              Text(
                'Elapsed Time: ${_formatElapsedTime()}',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
