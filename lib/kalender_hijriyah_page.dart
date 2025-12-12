import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KalenderHijriyahPage extends StatefulWidget {
  const KalenderHijriyahPage({super.key});

  @override
  State<KalenderHijriyahPage> createState() => _KalenderHijriyahPageState();
}

class _KalenderHijriyahPageState extends State<KalenderHijriyahPage> {
  String hijriDay = "";
  String hijriMonth = "";
  String hijriYear = "";
  bool loading = true;

  final Map<String, String> bulanHijriID = {
    "Muharram": "Muharram",
    "Safar": "Safar",
    "Rabi' al-Awwal": "Rabiul Awal",
    "Rabi' al-Thani": "Rabiul Akhir",
    "Jumada al-Ula": "Jumadil Awal",
    "Jumada al-Thani": "Jumadil Akhir",
    "Rajab": "Rajab",
    "Sha'ban": "Sya'ban",
    "Ramadan": "Ramadhan",
    "Shawwal": "Syawal",
    "Dhu al-Qadah": "Dzulqa'dah",
    "Dhu al-Hijjah": "Dzulhijjah",
  };

  @override
  void initState() {
    super.initState();
    fetchHijriDate();
  }

  Future<void> fetchHijriDate() async {
    final today = DateTime.now();
    final apiUrl =
        "https://api.aladhan.com/v1/gToH?date=${today.day}-${today.month}-${today.year}";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final data = json.decode(response.body);

      final monthEn = data["data"]["hijri"]["month"]["en"];

      setState(() {
        hijriDay = data["data"]["hijri"]["day"];
        hijriMonth = bulanHijriID[monthEn] ?? monthEn;
        hijriYear = data["data"]["hijri"]["year"];
        loading = false;
      });
    } catch (e) {
      setState(() {
        hijriDay = "-";
        hijriMonth = "Gagal memuat";
        hijriYear = "-";
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kalender Hijriyah",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          size: 70,
                          color: Colors.green.shade700,
                        ),

                        const SizedBox(height: 16),

                        Text(
                          "$hijriDay $hijriMonth $hijriYear H",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Hari ini: ${today.day}/${today.month}/${today.year} M",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade700,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: fetchHijriDate,
                            icon: const Icon(Icons.refresh, color: Colors.white),
                            label: Text(
                              "Perbarui Tanggal",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
