
import 'package:flutter/material.dart';
import 'profil_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final nimController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool sembunyikanPassword = true;

  void login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    if (nimController.text.trim() == '1124160152' &&
        passwordController.text == 'ilham123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilPage(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('NIM atau Password salah!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    nimController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Mahasiswa'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),

                const Text(
                  'PROFIL MAHASISWA',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                TextFormField(
                  controller: nimController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'NIM',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIM tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: passwordController,
                  obscureText: sembunyikanPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        sembunyikanPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          sembunyikanPassword =
                              !sembunyikanPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : login,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text('LOGIN'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
