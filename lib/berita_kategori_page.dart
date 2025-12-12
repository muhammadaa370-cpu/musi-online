import 'package:flutter/material.dart';
import 'webview_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BeritaKategoriPage extends StatefulWidget {
  const BeritaKategoriPage({super.key});

  @override
  State<BeritaKategoriPage> createState() => _BeritaKategoriPageState();
}

class _BeritaKategoriPageState extends State<BeritaKategoriPage> {
  final TextEditingController _searchController = TextEditingController();

  // LIST PESANTREN LENGKAP
final List<Map<String, dynamic>> pesantrenBaru = [
  {
    "nama": "Mahad Aly Hasyim Asy'ari Tebuireng",
    "url": "https://tebuireng.ac.id",
    "deskripsi": "Mahasantri Masa Kini Ulama Masa Depan.",
  },
  {
    "nama": "Yaspida Sukabumi",
    "url": "https://www.yaspidasukabumi.or.id",
    "deskripsi": "kampus Prestasi Berkarakter Islami.",
  },
  {
    "nama": "Ma'had Aly MUDI",
    "url": "https://mahadalymudi.ac.id",
    "deskripsi": "Lembaga tinggi kitab kuning di MUDI Mesjid Raya Aceh.",
  },
  {
    "nama": "An-Nawawi Berjan",
    "url": "https://www.annawawiberjan.id",
    "deskripsi":
        "Pesantren salaf yang dikelola dengan manajemen modern yang diasuh oleh KH. Achmad Chalwani (Rais Ali Idarah Aliyah JATMAN PBNU).",
  },
  {
    "nama": "Anwarul Quran Palu",
    "url": "https://anwarulquranpalu.id",
    "deskripsi": "Pesantren tahfidz Al-Qur'an di Sulawesi Tengah.",
  },
  {
    "nama": "Ponpes Gasek",
    "url": "https://ponpesgasek.id",
    "deskripsi": "Pesantren khas Malang, terkenal ramah & bernuansa seni.",
  },
  {
    "nama": "Idrisiyyah",
    "url": "https://www.idrisiyyah.or.id",
    "deskripsi": "Pesantren tarekat dengan fokus dzikir & pendidikan.",
  },
  {
    "nama": "Fadllul Wahid",
    "url": "https://www.fadllulwahid.com",
    "deskripsi": "Pesantren dakwah dan pendidikan berbasis masyarakat.",
  },
  {
    "nama": "Al-Munawwir",
    "url": "https://almunawwir.com",
    "deskripsi": "Pesantren tahfidz besar di Krapyak, Yogyakarta.",
  },
  {
    "nama": "Mahad Aly Parappe",
    "url": "https://www.mahadalyparappe.ac.id",
    "deskripsi": "Kampus kajian kitab kuning di Sulawesi Barat.",
  },
  {
    "nama": "Pesantren Universal",
    "url": "https://pesantrenuniversal.com",
    "deskripsi": "Pesantren modern yang menggabungkan sains & agama.",
  },
  {
    "nama": "Sirojuth Tholibin",
    "url": "https://sirojuth-tholibin.net",
    "deskripsi": "Pesantren salaf kuat dalam nahwu, sharaf & fiqh.",
  },
  {
    "nama": "Ittifaqiah",
    "url": "https://ittifaqiah.ac.id",
    "deskripsi": "Pesantren besar di Palembang dengan fokus kaderisasi guru.",
  },
  {
    "nama": "Al-Qodiriy Ponpes",
    "url":
        "https://alqodiriyponpes-hsbpw.wordpress.com/2025/11/29/hello-world/",
    "deskripsi": "Website informasi pondok berbasis WordPress.",
  },
  {
    "nama": "Salafiyah Parappe",
    "url": "https://salafiyahparappe.polman.web.id",
    "deskripsi": "Pesantren salaf di Polman, Sulawesi Barat.",
  },
  {
    "nama": "DDI Mattoanging",
    "url": "https://pesantrenddimattoanging.com",
    "deskripsi": "Pesantren DDI Mattoanging dengan pendidikan diniyah.",
  },
  {
    "nama": "An-Nur Tangkit",
    "url": "https://www.annurtangkit.ponpes.id",
    "deskripsi":
        "Pesantren An-Nur Tangkit berbasis pendidikan formal & diniyah.",
  },
  {
    "nama": "MTs Khozin",
    "url": "https://mtskhozin.sch.id",
    "deskripsi": "Madrasah Tsanawiyah Khozin dengan basis pendidikan Islam.",
  },
  {
    "nama": "Ishlaahul Ummah",
    "url": "https://ishlaahulummahsolear.com",
    "deskripsi": "Lembaga pendidikan Islam Ishlaahul Ummah.",
  },
  {
    "nama": "Al-Yasini",
    "url": "https://alyasini.net",
    "deskripsi": "Pesantren Al-Yasini Pasuruan.",
  },
  {
    "nama": "As'adiyah Pusat",
    "url": "https://asadiyahpusat.org",
    "deskripsi": "Pesantren besar As'adiyah Pusat di Sengkang.",
  },
  {
    "nama": "Wiztren Sumsel 5",
    "url": "https://wiztrensumsel5.wordpress.com",
    "deskripsi": "Website ponpes berbasis WordPress Sumatera Selatan.",
  },
  {
    "nama": "MA Minthol",
    "url": "https://ma.minthol.sch.id",
    "deskripsi": "Madrasah Aliyah Minthol.",
  },
  {
    "nama": "HAMWEB",
    "url": "http://hamweb.rf.gd",
    "deskripsi": "Website komunitas HAMWEB.",
  },
  {
    "nama": "WP Shortlink",
    "url": "https://wp.me/PgXnCn-j",
    "deskripsi": "Tautan pendek WordPress untuk halaman tertentu.",
  },
  {
    "nama": "Pondok Pendawa",
    "url": "https://pondok-pendawa.netlify.app",
    "deskripsi": "Website pondok berbasis Netlify.",
  },
  {
    "nama": "Media Azzura",
    "url": "https://mediaazzurashoot.wordpress.com",
    "deskripsi": "Media publikasi Azzura berbasis WordPress.",
  },
  {
    "nama": "Aisyah Afiqah",
    "url": "https://aisyahafiqah5.wordpress.com",
    "deskripsi": "Blog pribadi Aisyah Afiqah.",
  },
  {
    "nama": "HADQI",
    "url": "https://hadqi.wordpress.com",
    "deskripsi":
        "Website informasi dan publikasi keislaman berbasis WordPress.",
  },
  {
    "nama": "Diniyah Al-Qodir",
    "url": "https://diniyah.alqodir.sch.id",
    "deskripsi": "Madrasah diniyah Al-Qodir dengan fokus pendidikan agama.",
  },
  {
    "nama": "Pesantren Almubarok Borikamase",
    "url": "https://bykhalilullah.rf.gd",
    "deskripsi": "Pendidikan Kitab Kuning di Lekoala Maros.",
  },
  {
    "nama": "Madrasah Islamiyah Salafiyah An-nawawiyah",
    "url": "https://misannawawiyah.wordpress.com/",
    "deskripsi": "Pendidikan Berbasis Salaf.",
  },
  {
    "nama": "Pondok Pesantren Al Falah Puteri Banjarbaru",
    "url": "https://alfalahputeribjb84.netlify.app/",
    "deskripsi": "Pendidikan Kitab Kuning.",
  },
  {
    "nama": "Ma'had Aly Darul Munawwarah Kuta Krueng",
    "url": "https://mahadalydarulmunawwarah.com/",
    "deskripsi": "Pidie Jaya - Aceh.",
  },

  // 🔥 DATA BARU (DITAMBAHKAN)
  {
    "nama": "PPRQ Al-Maghfuri",
    "url": "https://pprqalmaghfuri.com/",
    "deskripsi": "Pesantren Pendidikan dan Tahfidz Al-Qur'an Al-Maghfuri.",
  },
   {
    "nama": "PMP kelas 3",
    "url": ":https://tugas-pmp-kelas-c.netlify.app//",
    "deskripsi": "Pesantren kilat.",
  },
];


  late List<Map<String, dynamic>> _allPesantren;
  List<Map<String, dynamic>> _filteredPesantren = [];

  @override
  void initState() {
    super.initState();

    // SALIN LIST UTAMA
    _allPesantren = List.from(pesantrenBaru);

    // TAMPILAN AWAL
    _filteredPesantren = List.from(_allPesantren);

    // SEARCH LISTENER
    _searchController.addListener(_onSearchChanged);
  }

  // FUNGSI SEARCH
  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      _filteredPesantren = _allPesantren.where((p) {
        return p["nama"].toLowerCase().contains(query) ||
            p["deskripsi"].toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kategori Pesantren",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: [
          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Cari pesantren...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.green.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // LIST VIEW
          Expanded(
            child: ListView.builder(
              itemCount: _filteredPesantren.length,
              itemBuilder: (context, index) {
                final item = _filteredPesantren[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(14),
                      leading: CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        child: const Icon(Icons.school, color: Colors.green),
                      ),
                      title: Text(
                        item["nama"],
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        item["deskripsi"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebViewPage(url: item["url"]),
                          ),
                        );
                      },
                    ),
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
