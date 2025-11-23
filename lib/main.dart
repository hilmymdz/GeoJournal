import 'package:flutter/material.dart';
import 'package:geo_jurnal/screens/welcome_screen.dart';
  
void main() {
  runApp(const GeoJournal());
}

class GeoJournal extends StatelessWidget {
  const GeoJournal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoJournal',
      debugShowCheckedModeBanner: false,
      // Tema Aplikasi: Sage Green & Cream Palette
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 253, 253, 248), // Cream Background
        
        // Skema Warna Utama
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3C6658), 
          primary: const Color(0xFF3C6658),
          secondary: const Color(0xFFA3B18A), 
          surface: const Color(0xFFFDFCF4),
          onPrimary: Colors.white,
        ),

        // Tema AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3C6658),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),

        // Tema Tombol
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3C6658),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        // Tema Input Form
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white, 
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF3C6658)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF3C6658)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF3C6658), width: 2),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}