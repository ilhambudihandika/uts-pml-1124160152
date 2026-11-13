import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login mahasiswa'),
      ),
    body: const Center(
      child: Text('selamat datang',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      ),
    ),
    );
  }
}