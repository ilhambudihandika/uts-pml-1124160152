
import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
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

              const Text(
                'Ilham Budi Handika',
                style: TextStyle(
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

              const Card(
                child: Column(
                  children: [
                    InfoTile(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'ilhamhandika@gmail.com',
                    ),
                    InfoTile(
                      icon: Icons.phone,
                      label: 'Nomor HP',
                      value: '081517729430',
                    ),
                    InfoTile(
                      icon: Icons.code,
                      label: 'GitHub',
                      value: 'github.com/ilhambudihandika',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
