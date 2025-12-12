import 'package:flutter/material.dart';

class KitabPage extends StatelessWidget {
  const KitabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kitab / Artikel Offline")),
      body: Center(child: Text("Halaman Kitab Offline")),
    );
  }
}
