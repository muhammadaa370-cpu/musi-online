import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JadwalSholatPage extends StatefulWidget {
  const JadwalSholatPage({super.key});

  @override
  State<JadwalSholatPage> createState() => _JadwalSholatPageState();
}

class _JadwalSholatPageState extends State<JadwalSholatPage> {
  TimeOfDay? subuh;
  TimeOfDay? dzuhur;
  TimeOfDay? ashar;
  TimeOfDay? maghrib;
  TimeOfDay? isya;

  @override
  void initState() {
    super.initState();

    // Default jadwal manual (bisa kamu ganti)
    subuh = const TimeOfDay(hour: 04, minute: 35);
    dzuhur = const TimeOfDay(hour: 12, minute: 05);
    ashar = const TimeOfDay(hour: 15, minute: 20);
    maghrib = const TimeOfDay(hour: 18, minute: 12);
    isya = const TimeOfDay(hour: 19, minute: 25);
  }

  Widget buildJadwalCard(String nama, TimeOfDay waktu, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.teal, size: 34),
        title: Text(
          nama,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        trailing: Text(
          "${waktu.hour.toString().padLeft(2, '0')}:${waktu.minute.toString().padLeft(2, '0')}",
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jadwal Sholat",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildJadwalCard("Subuh", subuh!, Icons.brightness_3),
          buildJadwalCard("Dzuhur", dzuhur!, Icons.wb_sunny),
          buildJadwalCard("Ashar", ashar!, Icons.sunny),
          buildJadwalCard("Maghrib", maghrib!, Icons.nights_stay),
          buildJadwalCard("Isya", isya!, Icons.dark_mode),
        ],
      ),
    );
  }
}
