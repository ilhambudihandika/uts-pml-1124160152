
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Keahlian dan Hobi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.code),
                  title: Text('Dart'),
                  subtitle: Text('Belajar bahasa pemrograman Dart'),
                ),
                ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Text('Flutter'),
                  subtitle: Text('Belajar membuat aplikasi mobile'),
                ),
                ListTile(
                  leading: Icon(Icons.menu_book),
                  title: Text('Membaca'),
                  subtitle: Text('Hobi membaca dan belajar hal baru'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Riwayat Pendidikan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Sekolah Dasar'),
                  subtitle: Text('SDN PANUNGGANGAN 10'),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('SMP'),
                  subtitle: Text('SMP NEGERI 23'),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('SMA / SMK'),
                  subtitle: Text('SMK NEGERI 4 KOTA TANGERANG'),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Perguruan Tinggi'),
                  subtitle: Text('Global Institute - Teknik Informatika'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
