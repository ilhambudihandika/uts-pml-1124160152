
import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';
import 'edit_profil_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String nama = 'Ilham Budi Handika';
  String email = 'ilhamhandika@gmail.com';
  String noHp = '081517729430';

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

    if (!mounted) return;

    if (hasil != null) {
      setState(() {
        nama = hasil['nama']!;
        email = hasil['email']!;
        noHp = hasil['noHp']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: editProfil,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 55,
                child: Icon(
                  Icons.person,
                  size: 65,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                nama,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text('1124160152'),
              const Text('Teknik Informatika'),
              const Text('TI 24 SE 1'),

              const SizedBox(height: 10),

              const Text(
                'Saya adalah mahasiswa yang sedang belajar '
                'pemrograman dan pengembangan aplikasi mobile.',
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
                      label: 'Nomor HP',
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

              const SizedBox(height: 15),

              ElevatedButton.icon(
                onPressed: editProfil,
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
