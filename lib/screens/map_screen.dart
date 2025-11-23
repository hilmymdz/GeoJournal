import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../data/dummy_data.dart';
import '../models/journal_entry.dart';


class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Titik Tengah Default (Jawa Tengah)
    final initialCenter = const LatLng(-7.6145, 110.7122); 

    return Scaffold(
      appBar: AppBar(title: const Text("Exploration Map")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: initialCenter, // Menggunakan 'initialCenter' untuk flutter_map v6+
          initialZoom: 7.5,
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.all, // Zoom & Pan enabled
          ),
        ),
        children: [
          // Layer 1: Tile Layer (Peta Dasar OpenStreetMap)
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.geojournal', // Best practice: identify app
          ),
          
          // Layer 2: Marker Layer (Pin Lokasi dari Data Jurnal)
          MarkerLayer(
            markers: dummyJournals.map((journal) {
              return Marker(
                point: journal.coordinates,
                width: 60,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    // Menampilkan BottomSheet saat marker diklik
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => _MapDetailSheet(journal: journal),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black26)],
                        ),
                        child: const Icon(Icons.location_pin, size: 30, color: Colors.red),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          journal.title,
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _MapDetailSheet extends StatelessWidget {
  final JournalEntry journal;
  const _MapDetailSheet({required this.journal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(journal.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Icon(Icons.map, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(journal.locationName, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(journal.imageUrl, height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(journal.description, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}