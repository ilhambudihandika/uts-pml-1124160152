
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final String dartDesc;
  final String flutterDesc;
  final String membacaDesc;
  final String sd;
  final String smp;
  final String smk;
  final String kuliah;

  const AboutPage({
    super.key,
    required this.dartDesc,
    required this.flutterDesc,
    required this.membacaDesc,
    required this.sd,
    required this.smp,
    required this.smk,
    required this.kuliah,
  });

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

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.code),
                  title: const Text('Dart'),
                  subtitle: Text(dartDesc),
                ),
                ListTile(
                  leading: const Icon(Icons.phone_android),
                  title: const Text('Flutter'),
                  subtitle: Text(flutterDesc),
                ),
                ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: const Text('Membaca'),
                  subtitle: Text(membacaDesc),
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

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text('Sekolah Dasar'),
                  subtitle: Text(sd),
                ),
                ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text('SMP'),
                  subtitle: Text(smp),
                ),
                ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text('SMA / SMK'),
                  subtitle: Text(smk),
                ),
                ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text('Perguruan Tinggi'),
                  subtitle: Text(kuliah),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
