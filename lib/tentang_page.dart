import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // untuk Clipboard (share)
import 'package:google_fonts/google_fonts.dart';
import 'webview_page.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  // Fungsi untuk membagikan aplikasi
  void shareApp(BuildContext context) {
    const String appUrl =
        "https://gehasekip.my.id/apk"; // ganti link sesuai kebutuhanmu

    Clipboard.setData(const ClipboardData(text: appUrl));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Link aplikasi disalin: $appUrl"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tentang Aplikasi",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // ======================
            // LOGO APLIKASI (Fix error decode)
            // ======================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? Colors.green.shade900 : Colors.green.shade50,
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,

                  // PERBAIKAN TERPENTING
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.apps,
                      size: 70,
                      color: Colors.green,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Nama aplikasi
            Text(
              "PMP 2025",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Versi 1.0.0",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),

            const SizedBox(height: 20),

            // Deskripsi
            Text(
              "Aplikasi ini merupakan hasil penerapan dari pelatihan multimedia pesantren, "
              "yang mengajarkan teknik penggunaan prompt secara efektif.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14),
            ),

            const SizedBox(height: 30),

            // ======================
            // SOSIAL MEDIA (2 Instagram)
            // ======================
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.green.shade800
                          : Colors.green.shade100,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                    ),
                    child: Text(
                      "Sosial Media",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // Instagram 1
                  ListTile(
                    leading: Icon(Icons.camera_alt, color: Colors.purple),
                    title: Text("Instagram Utama", style: GoogleFonts.poppins()),
                    subtitle: Text("@gehasekip"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WebViewPage(
                            url:
                                "https://www.instagram.com/gehasekip?igsh=MTVzN3Y0d3M2eGI2MA==",
                          ),
                        ),
                      );
                    },
                  ),

                  // Instagram 2
                  ListTile(
                    leading: Icon(Icons.camera_alt, color: Colors.purple),
                    title:
                        Text("Instagram Pelatihan", style: GoogleFonts.poppins()),
                    subtitle: Text("@ppmp.pesantren"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WebViewPage(
                            url: "https://www.instagram.com/ppmp.pesantren",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ======================
            // BAGIKAN APLIKASI
            // ======================
            ListTile(
              leading: Icon(Icons.share, color: Colors.green),
              title: Text("Bagikan Aplikasi", style: GoogleFonts.poppins()),
              subtitle: Text("Salin & bagikan link aplikasi"),
              onTap: () => shareApp(context),
            ),

            // ======================
            // KONTAK
            // ======================
            ListTile(
              leading: Icon(Icons.email, color: Colors.green),
              title: Text("Kontak Developer", style: GoogleFonts.poppins()),
              subtitle: Text("muhammadaa370@gmail.com"),
            ),

            // ======================
            // WEBSITE
            // ======================
            ListTile(
              leading: Icon(Icons.link, color: Colors.green),
              title: Text("Website Utama", style: GoogleFonts.poppins()),
              subtitle: Text("Klik untuk membuka website utama"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WebViewPage(
                      url:
                          "https://www.instagram.com/gehasekip?igsh=MTVzN3Y0d3M2eGI2MA==",
                    ),
                  ),
                );
              },
            ),

            // ======================
            // LISENSI
            // ======================
            ListTile(
              leading: Icon(Icons.info, color: Colors.green),
              title: Text("Lisensi & Hak Cipta", style: GoogleFonts.poppins()),
              subtitle: Text("© 2025 Aplikasi Karya PPMP Palembang"),
            ),
          ],
        ),
      ),
    );
  }
}
