
import 'package:flutter/material.dart';
import 'edit_profil_page.dart';
import 'about_page.dart';
import '../widgets/info_tile.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String nama = 'Ilham Budi Handika';
  String email = 'ilhamhandika27@gmail.com';
  String noHp = '081517729430';

  final String nim = '1124160152';
  final String prodi = 'Teknik Informatika';
  final String kelas = 'TI 24 SE 1';

  Future<void> editProfil() async {
    final hasil = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilPage(
          nama: nama,
          email: email,
          noHp: noHp,
        ),
      ),
    );

    if (hasil != null) {
      setState(() {
        nama = hasil['nama'] ?? nama;
        email = hasil['email'] ?? email;
        noHp = hasil['noHp'] ?? noHp;
      });
    }
  }

  void bukaTentangSaya() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            onPressed: editProfil,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(
                'assets/images/foto_profil.jpg',
              ),
            ),
            const SizedBox(height: 16),

            Text(
              nama,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text('NIM: $nim'),
            Text(prodi),
            Text(kelas),

            const SizedBox(height: 20),

            const Text(
              'Mahasiswa Teknik Informatika',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            Card(
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.email,
                    label: 'Email',
                    value: email,
                  ),
                  InfoTile(
                    icon: Icons.phone,
                    label: 'No. HP',
                    value: noHp,
                  ),
                  const InfoTile(
                    icon: Icons.code,
                    label: 'GitHub',
                    value: 'github.com/ilhambudihandika',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: editProfil,
                child: const Text('Edit Profil'),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: bukaTentangSaya,
                child: const Text('Tentang Saya'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
