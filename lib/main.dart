
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ilham budi handika'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('info'),
                ),
              );
            },
            icon: const Icon(Icons.info),
            tooltip: 'info',
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 25,
                child: Icon(Icons.person),
              ),
              Text('ilham budi handika'),
              Text('1124160152'),
              Text('Teknik Informatika'),
              const SizedBox(height: 20),

              Card(
                color: const Color(0xFFFFF1ED),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(
                    color: Color(0xFFEADAD5),
                  ),
                ),
                child: const Column(
                  children: [
                    InfoTile(
                      ikon: Icons.email,
                      label: 'email',
                      value: 'ilhamhandika27@gmail.com',
                    ),

  

                    InfoTile(
                      ikon: Icons.phone,
                      label: 'Nomor TelePhone',
                      value: '0815-1772-9430',
                    ),


                    InfoTile(
                      ikon: Icons.facebook,
                      label: 'Nama Facebook',
                      value: 'ilham budi handika',
                    ),


                    InfoTile(
                      ikon: Icons.telegram,
                      label: 'Nama Telegram',
                      value: '@ilhamhandika',
                    ),


                    InfoTile(
                      ikon: Icons.home,
                      label: 'alamat rumah',
                      value: 'alam sutera',
                    ),

                    InfoTile(
                      ikon: Icons.apple_rounded,
                      label: 'apple',
                      value: 'iphone',
                    ),


                    InfoTile(
                      ikon: Icons.account_balance_wallet,
                      label: 'dompet',
                      value: 'kosong',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('tambah'),
            ),
          );
        },
        tooltip: 'tambah',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.ikon,
    required this.label,
    required this.value,
  });

  final IconData ikon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(ikon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
