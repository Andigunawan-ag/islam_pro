import 'package:flutter/material.dart';

// Halaman utama Bacaan Salat
class BacaanSalatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacaan Salat'),
        leading: IconButton(
          icon: Icon(Icons.home), // Ganti ikon menjadi ikon home
          onPressed: () {
            // Fungsi kembali (pop dari stack navigasi)
            Navigator.pop(context);
          },
        ),
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
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Bacaan Salat'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          buildCard(context, 'Bacaan dan Niat Salat Subuh', BacaanSubuhPage()),
          buildCard(context, 'Bacaan dan Niat Salat Dzuhur', BacaanDzuhurPage()),
          buildCard(context, 'Bacaan dan Niat Salat Asar', BacaanAsarPage()),
          buildCard(context, 'Bacaan dan Niat Salat Maghrib', BacaanMaghribPage()),
          buildCard(context, 'Bacaan dan Niat Salat Isya', BacaanIsyaPage()),
        ],
      ),
    );
  }

  // Fungsi untuk membuat card bacaan salat
  Widget buildCard(BuildContext context, String title, Widget page) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(
          Icons.menu_book,
          color: Colors.blueAccent,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
      ),
    );
  }
}

// Halaman Home
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Halaman Bacaan Salat Subuh
class BacaanSubuhPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BacaanPage(
      title: 'Bacaan dan Niat Subuh',
      niat: 'Usholli fardhos shubhi...',
      artiNiat: 'Aku berniat salat fardu Subuh...',
      bacaan: 'Subhanaka Allahumma...',
      artiBacaan: 'Mahasuci Engkau ya Allah...',
    );
  }
}

// Halaman Bacaan Salat Dzuhur
class BacaanDzuhurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BacaanPage(
      title: 'Bacaan dan Niat Dzuhur',
      niat: 'Usholli fardhodh dhuhri...',
      artiNiat: 'Aku berniat salat fardu Dzuhur...',
      bacaan: 'Subhanaka Allahumma...',
      artiBacaan: 'Mahasuci Engkau ya Allah...',
    );
  }
}

// Halaman Bacaan Salat Asar
class BacaanAsarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BacaanPage(
      title: 'Bacaan dan Niat Asar',
      niat: 'Usholli fardhol \'ashri...',
      artiNiat: 'Aku berniat salat fardu Asar...',
      bacaan: 'Subhanaka Allahumma...',
      artiBacaan: 'Mahasuci Engkau ya Allah...',
    );
  }
}

// Halaman Bacaan Salat Maghrib
class BacaanMaghribPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BacaanPage(
      title: 'Bacaan dan Niat Maghrib',
      niat: 'Usholli fardhol maghribi...',
      artiNiat: 'Aku berniat salat fardu Maghrib...',
      bacaan: 'Subhanaka Allahumma...',
      artiBacaan: 'Mahasuci Engkau ya Allah...',
    );
  }
}

// Halaman Bacaan Salat Isya
class BacaanIsyaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BacaanPage(
      title: 'Bacaan dan Niat Isya',
      niat: 'Usholli fardhol isyaa-i...',
      artiNiat: 'Aku berniat salat fardu Isya...',
      bacaan: 'Subhanaka Allahumma...',
      artiBacaan: 'Mahasuci Engkau ya Allah...',
    );
  }
}

// Widget umum untuk menampilkan bacaan dan niat salat
class BacaanPage extends StatelessWidget {
  final String title;
  final String niat;
  final String artiNiat;
  final String bacaan;
  final String artiBacaan;

  BacaanPage({
    required this.title,
    required this.niat,
    required this.artiNiat,
    required this.bacaan,
    required this.artiBacaan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Niat Salat', niat, artiNiat),
            SizedBox(height: 20),
            _buildSection('Bacaan Salat', bacaan, artiBacaan),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String bacaan, String artiBacaan) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 10),
        Text(
          bacaan,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          'Artinya: $artiBacaan',
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
