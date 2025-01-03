import 'package:flutter/material.dart';
import '../models/comic.dart'; // Import model Comic

class ComicDetailPage extends StatelessWidget {
  final int comicId;

  const ComicDetailPage({super.key, required this.comicId});

  @override
  Widget build(BuildContext context) {
    // Mencari komik berdasarkan ID
    final comic = comics.firstWhere((comic) => comic.id == comicId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Comic Detail #$comicId"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar komik
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Image.network(
                  comic.imageUrl, // Menggunakan URL gambar dari model
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              // Judul komik
              Text(
                comic.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Deskripsi komik
              Text(
                comic.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Tombol aksi
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Read Comic feature coming soon!')),
                  );
                },
                child: Text("Read Comic"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
