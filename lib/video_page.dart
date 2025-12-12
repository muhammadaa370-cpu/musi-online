import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'webview_page.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  // 👉 GANTI link YouTube ini dengan link dokumenter milik panjenengan
  static const String youtubeUrl =
      "https://youtu.be/QHlX0GIFGME?si=YzjBK0jUMNhBuiSz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video Dokumenter",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: const Icon(Icons.play_circle_fill, size: 40),
              title: Text(
                "Dokumenter Pesantren",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "Tap untuk menonton dokumenter di YouTube.",
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WebViewPage(url: youtubeUrl),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
