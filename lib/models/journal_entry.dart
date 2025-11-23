import 'package:latlong2/latlong.dart';


class JournalEntry {
  final String id;
  final String title;
  final String locationName;
  final String description;
  final String imageUrl;
  final LatLng coordinates;
  final DateTime date;

  JournalEntry({
    required this.id,
    required this.title,
    required this.locationName,
    required this.description,
    required this.imageUrl,
    required this.coordinates,
    required this.date,
  });
}