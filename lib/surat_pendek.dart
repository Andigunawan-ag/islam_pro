import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SuratPendekPage extends StatefulWidget {
  const SuratPendekPage({super.key});

  @override
  _SuratPendekPageState createState() => _SuratPendekPageState();
}

class _SuratPendekPageState extends State<SuratPendekPage> {
  bool isLoading = false;
  Map<String, dynamic> suratDetail = {};

  // Daftar surat pendek yang ditampilkan dalam ListView
  final List<Map<String, dynamic>> suratList = [
    {'id': 1, 'name': 'Al-Fatihah', 'number': 1},
    {'id': 2, 'name': 'Al-Ikhlas', 'number': 112},
    {'id': 3, 'name': 'Al-Falaq', 'number': 113},
    {'id': 4, 'name': 'An-Nas', 'number': 114},
    // Tambahkan surat lainnya sesuai keinginan
  ];

  // Fungsi untuk mengambil detail surat berdasarkan nomor surat
  Future<void> _fetchSuratDetail(int suratNumber) async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://api.alquran.cloud/v1/surah/$suratNumber'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        suratDetail = data['data'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load Surat Detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surat Pendek - Pilih Surat'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : suratDetail.isEmpty
          ? ListView.builder(
        itemCount: suratList.length,
        itemBuilder: (context, index) {
          final surat = suratList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(surat['name']),
              onTap: () {
                _fetchSuratDetail(surat['number']);
              },
            ),
          );
        },
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              suratDetail['name'] ?? 'Nama Surat',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: suratDetail['ayahs']?.length ?? 0,
                itemBuilder: (context, index) {
                  final ayat = suratDetail['ayahs'][index];
                  final arabicText = ayat['text'] ?? '';
                  final latinText = ayat['translation'] ?? '';  // Add latin text
                  final translation = ayat['translation'] ?? '';  // Add translation

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            arabicText,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            latinText,  // Show Latin Text (if available)
                            style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            translation,  // Show Translation
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
