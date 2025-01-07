import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // Tambahkan package intl
import 'bacaan_salat.dart'; // Import halaman Bacaan Salat
import 'surat_pendek.dart'; // Import halaman Surat Pendek

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jadwal Salat',
      debugShowCheckedModeBanner: false,  // Menonaktifkan banner debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> timings = {};
  bool isLoading = true;
  String hijriDate = '';
  String gregorianDate = '';
  String currentDateTime = '';

  @override
  void initState() {
    super.initState();
    fetchPrayerTimes();
    fetchHijriDate();
    fetchCurrentDateTime();
  }

  Future<void> fetchPrayerTimes() async {
    final city = 'Jakarta';
    final country = 'ID';
    final url = 'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=2';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          timings = data['data']['timings'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to load prayer times. Status code: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching prayer times: $e');
    }
  }

  Future<void> fetchHijriDate() async {
    final url = 'http://api.aladhan.com/v1/gToH?date=2024-12-30';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          hijriDate = data['data']['hijri']['date'];
          gregorianDate = data['data']['gregorian']['date'];
        });
      } else {
        print('Failed to load Hijri date. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching Hijri date: $e');
    }
  }

  void fetchCurrentDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, d MMMM yyyy, HH:mm:ss');
    setState(() {
      currentDateTime = formatter.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Salat'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Menu Sidebar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blueAccent),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.blueAccent),
              title: Text('Surat Pendek'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuratPendekPage()), // Arahkan ke halaman Surat Pendek
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.blueAccent),
              title: Text('Bacaan Salat Dan Doa-Doa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BacaanSalatPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                'Tanggal Hari Ini',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Gregorian: $gregorianDate\nHijriyah: $hijriDate',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                'Waktu Saat Ini',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                currentDateTime,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          buildPrayerTimeCard('Imsak', timings['Imsak']),
          buildPrayerTimeCard('Fajr', timings['Fajr']),
          buildPrayerTimeCard('Sunrise', timings['Sunrise']),
          buildPrayerTimeCard('Dhuhr', timings['Dhuhr']),
          buildPrayerTimeCard('Asr', timings['Asr']),
          buildPrayerTimeCard('Maghrib', timings['Maghrib']),
          buildPrayerTimeCard('Isha', timings['Isha']),
          buildPrayerTimeCard('Midnight', timings['Midnight']),
        ],
      ),
    );
  }

  Widget buildPrayerTimeCard(String prayer, String? time) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          prayer,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blueAccent,
          ),
        ),
        subtitle: Text(
          time ?? 'Tidak tersedia',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
