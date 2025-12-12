import 'package:flutter/material.dart';

class MasjidPage extends StatelessWidget {
  const MasjidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Masjid Terdekat")),
      body: Center(child: Text("Halaman Masjid Terdekat")),
    );
  }
}
