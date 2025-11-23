import 'package:flutter/material.dart';
import 'package:geo_jurnal/screens/about_screen.dart';
import 'package:geo_jurnal/screens/home_screen.dart';
import 'package:geo_jurnal/screens/map_screen.dart';

class MainNavigationScaffold extends StatefulWidget {
  const MainNavigationScaffold({super.key});

  @override
  State<MainNavigationScaffold> createState() => _MainNavigationScaffoldState();
}

class _MainNavigationScaffoldState extends State<MainNavigationScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(), // e. List Informasi
    const MapScreen(),  // d. Flutter Map
    const AboutScreen(), // g. About Aplikasi
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // Menggunakan IndexedStack agar state halaman tidak hilang saat pindah tab
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFFFDFCF4),
        indicatorColor: const Color.fromARGB(255, 211, 226, 184),
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.book_outlined),
            selectedIcon: Icon(Icons.book, color: Color(0xFF3C6658)),
            label: 'Journal',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map, color: Color(0xFF3C6658)),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info, color: Color(0xFF3C6658)),
            label: 'About',
          ),
        ],
      ),
    );
  }
}