import 'package:flutter/material.dart';

// Jangan aktifkan Firebase dulu
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

import 'home_page.dart';
import 'berita_kategori_page.dart';
import 'doa_harian_page.dart';
import 'kalender_hijriyah_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppBerita());
}

class AppBerita extends StatefulWidget {
  const AppBerita({super.key});

  @override
  State<AppBerita> createState() => _AppBeritaState();
}

class _AppBeritaState extends State<AppBerita> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    HomePage(key: ValueKey("home")),
    const BeritaKategoriPage(key: ValueKey("kategori")),
    const DoaHarianPage(key: ValueKey("doa")),
    const KalenderHijriyahPage(key: ValueKey("kalender")),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF007B8F),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF007B8F),
          foregroundColor: Colors.white,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF005E6C),
        scaffoldBackgroundColor: Colors.black,
      ),

      themeMode: ThemeMode.system,

      home: Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          ),
          child: pages[_currentIndex],
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFFF0C75E),
          unselectedItemColor: Colors.grey,
          iconSize: 28,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Kategori",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Doa"),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Kalender",
            ),
          ],
        ),
      ),
    );
  }
}
