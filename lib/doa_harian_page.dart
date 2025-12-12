import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoaHarianPage extends StatefulWidget {
  const DoaHarianPage({super.key});

  @override
  State<DoaHarianPage> createState() => _DoaHarianPageState();
}

class _DoaHarianPageState extends State<DoaHarianPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _allDoa = [
    {
      "judul": "Doa Sebelum Makan",
      "arab": "اللّهُـمَّ بارِكْ لَنا فيما رَزَقْتَنا وَقِنا عَذابَ النّارِ",
      "latin":
          "Allahumma baarik lanaa fiimaa razaqtanaa wa qinaa ‘adzaa bannaar.",
      "arti":
          "Ya Allah, berkahilah rezeki yang Engkau berikan kepada kami dan lindungilah kami dari azab neraka.",
    },
    {
      "judul": "Doa Sesudah Makan",
      "arab":
          "الْحَمْدُ لِلّٰهِ الَّذِيْ أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِيْنَ",
      "latin":
          "Alhamdu lillaahil-ladzii ath’amanaa wa saqaanaa wa ja’alanaa minal muslimiin.",
      "arti":
          "Segala puji bagi Allah yang telah memberi kami makan dan minum serta menjadikan kami termasuk orang-orang muslim.",
    },
    {
      "judul": "Doa Sebelum Tidur",
      "arab": "بِاسْمِكَ اللّهُمَّ أَحْيَا وَأَمُوْتُ",
      "latin": "Bismikallaahumma ahyaa wa amuut.",
      "arti": "Dengan nama-Mu ya Allah, aku hidup dan aku mati.",
    },
    {
      "judul": "Doa Bangun Tidur",
      "arab":
          "الْحَمْدُ لِلّٰهِ الَّذِيْ أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُوْرُ",
      "latin":
          "Alhamdu lillaahil-ladzii ahyaanaa ba’da maa amaatanaa wa ilaihin nusyuur.",
      "arti":
          "Segala puji bagi Allah yang telah menghidupkan kami setelah mematikan kami, dan hanya kepada-Nya kami dibangkitkan.",
    },
    {
      "judul": "Doa Masuk Kamar Mandi",
      "arab": "اللّهُمَّ إِنِّيْ أَعُوْذُبِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ",
      "latin": "Allahumma innii a’uudzubika minal khubutsi wal khabaa its.",
      "arti":
          "Ya Allah, aku berlindung kepada-Mu dari godaan setan laki-laki dan setan perempuan.",
    },
    {
      "judul": "Doa Keluar Rumah",
      "arab":
          "بِسْمِ اللّٰهِ تَوَكَّلْتُ عَلَى اللّٰهِ لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللّٰهِ",
      "latin":
          "Bismillaahi tawakkaltu ‘alallaahi laa hawla wa laa quwwata illaa billaah.",
      "arti":
          "Dengan nama Allah aku bertawakkal kepada Allah, tiada daya dan kekuatan kecuali dengan pertolongan Allah.",
    },
    {
      "judul": "Doa Masuk Rumah",
      "arab":
          "اللّٰهُمَّ إِنِّيْ أَسْأَلُكَ خَيْرَ الْمَوْلَجِ وَخَيْرَ الْمَخْرَجِ",
      "latin": "Allahumma innii as-aluka khoiral maulaji wa khoiral makhraj.",
      "arti":
          "Ya Allah, sesungguhnya aku memohon kepada-Mu sebaik-baik tempat masuk dan sebaik-baik tempat keluar.",
    },
  ];

  List<Map<String, String>> _filteredDoa = [];

  @override
  void initState() {
    super.initState();
    _filteredDoa = List.from(_allDoa);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredDoa = List.from(_allDoa);
      } else {
        _filteredDoa = _allDoa.where((doa) {
          final j = doa["judul"]!.toLowerCase();
          final l = doa["latin"]!.toLowerCase();
          return j.contains(query) || l.contains(query);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doa Harian",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Cari doa (misal: makan, tidur...)",
                hintStyle: GoogleFonts.poppins(fontSize: 13),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.green.shade50,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _filteredDoa.length,
              itemBuilder: (context, index) {
                final doa = _filteredDoa[index];
                return _buildDoaCard(doa);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoaCard(Map<String, String> doa) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul
              Text(
                doa["judul"]!,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),

              // Arab
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  doa["arab"]!,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.notoNaskhArabic(fontSize: 20),
                ),
              ),
              const SizedBox(height: 8),

              // Latin
              Text(
                doa["latin"]!,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 6),

              // Arti
              Text(doa["arti"]!, style: GoogleFonts.poppins(fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}
