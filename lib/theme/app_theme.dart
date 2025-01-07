import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,

  // Mengganti warna latar belakang menjadi biru pastel yang lebih lembut
  scaffoldBackgroundColor: Color(0xFFB3E5FC),  // Biru pastel

  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.blueAccent,
  ),

  iconTheme: IconThemeData(color: Colors.blue),
);
