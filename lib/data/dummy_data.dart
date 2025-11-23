import 'package:latlong2/latlong.dart';
import '../models/journal_entry.dart';


List<JournalEntry> dummyJournals = [
  JournalEntry(
    id: '1',
    title: "Sunrise di Bromo",
    locationName: "Gunung Bromo, Jawa Timur",
    description: "Menikmati keindahan matahari terbit dengan latar belakang kaldera yang megah. Udara sangat dingin namun pemandangannya magis.",
    imageUrl: "https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?q=80&w=1000&auto=format&fit=crop",
    coordinates: const LatLng(-7.942493, 112.953012),
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  JournalEntry(
    id: '2',
    title: "Kebun Teh Pangalengan",
    locationName: "Pangalengan, Jawa Barat",
    description: "Healing sejenak di hamparan kebun teh yang hijau. Suasana tenang, cocok untuk melepas penat dari hiruk pikuk kota.",
    imageUrl: "https://images.unsplash.com/photo-1641391926878-17412e8e33e7?q=80&w=1889&auto=format&fit=crop",
    coordinates: const LatLng(-7.179040, 107.563812),
    date: DateTime.now().subtract(const Duration(days: 5)),
  ),
  JournalEntry(
    id: '3',
    title: "Candi Borobudur",
    locationName: "Magelang, Jawa Tengah",
    description: "Wisata sejarah ke candi Buddha terbesar. Reliefnya sangat detail menceritakan kehidupan masa lampau.",
    imageUrl: "https://images.unsplash.com/photo-1596402184320-417e7178b2cd?q=80&w=1000&auto=format&fit=crop",
    coordinates: const LatLng(-7.607874, 110.203751),
    date: DateTime.now().subtract(const Duration(days: 10)),
  ),
];