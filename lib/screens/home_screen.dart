import 'package:flutter/material.dart';
import 'package:geo_jurnal/models/journal_entry.dart';
import 'package:geo_jurnal/data/dummy_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text("My Journal", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Capture the World", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyJournals.length,
        itemBuilder: (context, index) {
          final journal = dummyJournals[index];
          return _JournalCard(journal: journal);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF3A5A40),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _JournalCard extends StatelessWidget {
  final JournalEntry journal;

  const _JournalCard({required this.journal});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Warna background putih
      elevation: 4,        // Shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Rounded corner
      margin: const EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar
          Stack(
            children: [
              Image.network(
                journal.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 180, 
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator())
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 180,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${journal.date.day}/${journal.date.month}/${journal.date.year}",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
          // Informasi Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  journal.title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3C6658)),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.redAccent),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        journal.locationName,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  journal.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[600], height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}