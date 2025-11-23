import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF9EC),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4)],
              ),
              child: Image.asset(
                'assets/images/Logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.public, size: 80, color: Color(0xFF3C6658));
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "GeoJournal App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3C6658)),
            ),
            const SizedBox(height: 10),
            const Text(
              "Version 1.0.0\n\nGeoJournal is an app that helps you document your travel experiences by combining journaling with map locations. Capture your memories and explore the world with us!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 80),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFA3B18A)),
              ),
              child: Column(
                children: const [
                  Text("Developed By", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 10),
                  Divider(color: Color(0xFFA3B18A)),
                  SizedBox(height: 10),
                  Text(
                    "Hilmy Muhamad Dzakwan_23552011368",
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold, 
                      color: Color(0xFF3C6658)
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text("© 2025 All Rights Reserved", style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}