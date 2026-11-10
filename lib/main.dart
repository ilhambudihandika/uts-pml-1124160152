import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        
        
      ),
      darkTheme: ThemeData(colorSchemeSeed: Colors.deepOrange),
      home: profile(),
    );
  }
}
class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ilham budi handika'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('info')));
            
          },
          icon: Icon(Icons.info),
          tooltip: 'info',
          ),
        ],

      ),
    );
  }
}