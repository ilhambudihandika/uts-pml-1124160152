
import 'package:flutter/material.dart';

class EditProfilPage extends StatefulWidget {
  final String nama;
  final String email;
  final String noHp;
  final String nim;
  final String prodi;
  final String kelas;

  final String dartDesc;
  final String flutterDesc;
  final String membacaDesc;
  final String sd;
  final String smp;
  final String smk;
  final String kuliah;

  const EditProfilPage({
    super.key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.dartDesc,
    required this.flutterDesc,
    required this.membacaDesc,
    required this.sd,
    required this.smp,
    required this.smk,
    required this.kuliah,
  });

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController emailController;
  late TextEditingController noHpController;
  late TextEditingController nimController;
  late TextEditingController prodiController;
  late TextEditingController kelasController;

  late TextEditingController dartController;
  late TextEditingController flutterController;
  late TextEditingController membacaController;

  late TextEditingController sdController;
  late TextEditingController smpController;
  late TextEditingController smkController;
  late TextEditingController kuliahController;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(text: widget.nama);
    emailController = TextEditingController(text: widget.email);
    noHpController = TextEditingController(text: widget.noHp);
    nimController = TextEditingController(text: widget.nim);
    prodiController = TextEditingController(text: widget.prodi);
    kelasController = TextEditingController(text: widget.kelas);

    dartController = TextEditingController(text: widget.dartDesc);
    flutterController = TextEditingController(text: widget.flutterDesc);
    membacaController = TextEditingController(text: widget.membacaDesc);

    sdController = TextEditingController(text: widget.sd);
    smpController = TextEditingController(text: widget.smp);
    smkController = TextEditingController(text: widget.smk);
    kuliahController = TextEditingController(text: widget.kuliah);
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    noHpController.dispose();
    nimController.dispose();
    prodiController.dispose();
    kelasController.dispose();

    dartController.dispose();
    flutterController.dispose();
    membacaController.dispose();

    sdController.dispose();
    smpController.dispose();
    smkController.dispose();
    kuliahController.dispose();

    super.dispose();
  }

  Widget buatInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Data Profil',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              buatInput('Nama Lengkap', namaController),
              buatInput('Email', emailController),
              buatInput('Nomor HP', noHpController),
              buatInput('NIM', nimController),
              buatInput('Program Studi', prodiController),
              buatInput('Kelas', kelasController),

              const SizedBox(height: 10),

              const Text(
                'Keahlian dan Hobi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              buatInput('Keterangan Dart', dartController),
              buatInput('Keterangan Flutter', flutterController),
              buatInput('Keterangan Membaca', membacaController),

              const SizedBox(height: 10),

              const Text(
                'Riwayat Pendidikan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              buatInput('Sekolah Dasar', sdController),
              buatInput('SMP', smpController),
              buatInput('SMA / SMK', smkController),
              buatInput('Perguruan Tinggi', kuliahController),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, {
                        'nama': namaController.text,
                        'email': emailController.text,
                        'noHp': noHpController.text,
                        'nim': nimController.text,
                        'prodi': prodiController.text,
                        'kelas': kelasController.text,
                        'dartDesc': dartController.text,
                        'flutterDesc': flutterController.text,
                        'membacaDesc': membacaController.text,
                        'sd': sdController.text,
                        'smp': smpController.text,
                        'smk': smkController.text,
                        'kuliah': kuliahController.text,
                      });
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
