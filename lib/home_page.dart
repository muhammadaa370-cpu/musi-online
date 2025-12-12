import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import 'webview_page.dart';
import 'jadwal_sholat_page.dart';
import 'kitab_page.dart';
import 'video_page.dart';
import 'kalender_hijriyah_page.dart';
import 'doa_harian_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ======================================================
  // 🔥 6 FOTO LOKAL (ASSET)
  // ======================================================
  final List<Map<String, String>> galeriFoto = [
    {
      "img": "assets/images/galeri/foto1.jpg",
      "url": "https://www.instagram.com/gehasekip",
    },
    {
      "img": "assets/images/galeri/foto2.jpg",
      "url": "https://www.instagram.com/gehasekip",
    },
    {
      "img": "assets/images/galeri/foto3.jpg",
      "url": "https://www.instagram.com/gehasekip",
    },
    {
      "img": "assets/images/galeri/foto4.jpg",
      "url": "https://www.instagram.com/gehasekip",
    },
    {
      "img": "assets/images/galeri/foto5.jpg",
      "url": "https://www.instagram.com/gehasekip",
    },
    {
      "img": "assets/images/galeri/foto6.jpg",
      "url": "https://www.instagram.com/gehasekip",
    },
  ];

  final PageController _pageController = PageController(viewportFraction: 0.9);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      currentIndex = (currentIndex + 1) % galeriFoto.length;
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      _autoSlide();
    });
  }

  // ======================================================
  // BERITA LIST
  // ======================================================
  final List<Map<String, String>> beritaList = [
    {
      "judul": "UIN Raden Fatah Palembang",
      "gambar": "assets/images/berita/uin.png",
      "url":
          "https://www.instagram.com/uinrafahpalembang?igsh=MWZhdnkxNjFqZXR0YQ==",
    },
    {
      "judul": "Puspenma Kemenag",
      "gambar": "assets/images/berita/puspenma.jpg",
      "url": "https://beasiswa.kemenag.go.id",
    },
  ];

  // ======================================================
  // FITUR MENU
  // ======================================================
  final List<_FiturItem> fiturList = [
    _FiturItem(
      icon: Icons.access_time,
      title: 'Jadwal Sholat',
      pageBuilder: (context) => const JadwalSholatPage(),
    ),
    _FiturItem(
      icon: Icons.menu_book,
      title: 'Kitab / Artikel',
      pageBuilder: (context) => const KitabPage(),
    ),
    _FiturItem(
      icon: Icons.movie,
      title: 'Video Dokumenter',
      pageBuilder: (context) => const VideoPage(),
    ),
    _FiturItem(
      icon: Icons.calendar_month,
      title: 'Kalender Hijriyah',
      pageBuilder: (context) => const KalenderHijriyahPage(),
    ),
    _FiturItem(
      icon: Icons.menu_book_outlined,
      title: 'Doa Harian',
      pageBuilder: (context) => const DoaHarianPage(),
    ),
    _FiturItem(
      icon: Icons.folder_special,
      title: 'PMP 2025',
      pageBuilder: (context) => const WebViewPage(
        url:
            "https://drive.google.com/drive/folders/1KHCATmnffhWLr7plfOMREWDoG4rBVY9T?usp=drive_link",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Multimedia Santri Indonesia",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ======================================================
            // 🔥 GALERI SLIDER (ASSET)
            // ======================================================
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Galeri Kegiatan",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 220,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: galeriFoto.length,
                      itemBuilder: (context, index) {
                        final item = galeriFoto[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WebViewPage(url: item["url"]!),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.asset(
                                item["img"]!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ======================================================
            // FITUR ISLAMI
            // ======================================================
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                "Fitur Islami",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: fiturList.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) =>
                  _buildFiturCard(context, fiturList[index]),
            ),

            const SizedBox(height: 16),

            // ======================================================
            // BERITA LAINNYA (PERBAIKAN ASSET)
            // ======================================================
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                "Berita Lainnya",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: beritaList.length,
              itemBuilder: (context, index) {
                final item = beritaList[index];
                final bool isAsset = item["gambar"]!.startsWith("assets/");

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WebViewPage(url: item["url"]!),
                    ),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18),
                          ),
                          child: isAsset
                              ? Image.asset(
                                  item["gambar"]!,
                                  height: 190,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: item["gambar"]!,
                                  height: 190,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item["judul"]!,
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFiturCard(BuildContext context, _FiturItem item) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: item.pageBuilder)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(item.icon, size: 28, color: Colors.green.shade700),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            style: GoogleFonts.poppins(fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _FiturItem {
  final IconData icon;
  final String title;
  final Widget Function(BuildContext) pageBuilder;
  _FiturItem({
    required this.icon,
    required this.title,
    required this.pageBuilder,
  });
}
