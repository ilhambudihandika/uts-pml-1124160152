
import 'package:flutter/material.dart';
import 'edit_profil_page.dart';
import 'about_page.dart';
import '../widgets/info_tile.dart';
import 'login_page.dart';

class ProfilPage extends StatefulWidget {
  final VoidCallback? onUbahTema;
  final bool darkMode;

  const ProfilPage({
    super.key,
    this.onUbahTema,
    this.darkMode = false,
  });

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String nama = 'Ilham Budi Handika';
  String email = 'ilhamhandika27@gmail.com';
  String noHp = '081517729430';
  String nim = '1124160152';
  String prodi = 'Teknik Informatika';
  String kelas = 'TI 24 SE 1';

  String dartDesc = 'Belajar bahasa pemrograman Dart';
  String flutterDesc = 'Belajar membuat aplikasi mobile';
  String membacaDesc = 'Hobi membaca dan belajar hal baru';

  String sd = 'SDN PANUNGGANGAN 10';
  String smp = 'SMP NEGERI 23';
  String smk = 'SMK NEGERI 4 KOTA TANGERANG';
  String kuliah = 'Global Institute - Teknik Informatika';

  late bool darkMode;

  @override
  void initState() {
    super.initState();
    darkMode = widget.darkMode;
  }

  Future<void> editProfil() async {
    final hasil = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilPage(
          nama: nama,
          email: email,
          noHp: noHp,
          nim: nim,
          prodi: prodi,
          kelas: kelas,
          dartDesc: dartDesc,
          flutterDesc: flutterDesc,
          membacaDesc: membacaDesc,
          sd: sd,
          smp: smp,
          smk: smk,
          kuliah: kuliah,
        ),
      ),
    );

    if (hasil != null) {
      setState(() {
        nama = hasil['nama'] ?? nama;
        email = hasil['email'] ?? email;
        noHp = hasil['noHp'] ?? noHp;
        nim = hasil['nim'] ?? nim;
        prodi = hasil['prodi'] ?? prodi;
        kelas = hasil['kelas'] ?? kelas;

        dartDesc = hasil['dartDesc'] ?? dartDesc;
        flutterDesc = hasil['flutterDesc'] ?? flutterDesc;
        membacaDesc = hasil['membacaDesc'] ?? membacaDesc;

        sd = hasil['sd'] ?? sd;
        smp = hasil['smp'] ?? smp;
        smk = hasil['smk'] ?? smk;
        kuliah = hasil['kuliah'] ?? kuliah;
      });
    }
  }

  void bukaTentangSaya() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutPage(
          dartDesc: dartDesc,
          flutterDesc: flutterDesc,
          membacaDesc: membacaDesc,
          sd: sd,
          smp: smp,
          smk: smk,
          kuliah: kuliah,
        ),
      ),
    );
  }

  void ubahPengaturanTema(bool value) {
    setState(() {
      darkMode = value;
    });

    widget.onUbahTema?.call();
  }

  void logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          onUbahTema: widget.onUbahTema,
          darkMode: darkMode,
        ),
      ),
      (route) => false,
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

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(nama),
              accountEmail: Text(email),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/foto_profil.jpg',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Mahasiswa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.pop(context);
                editProfil();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                bukaTentangSaya();
              },
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              value: darkMode,
              onChanged: ubahPengaturanTema,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: logout,
            ),
          ],
        ),
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
