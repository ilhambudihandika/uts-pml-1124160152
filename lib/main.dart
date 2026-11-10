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
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  height: 18,
                )
              ],
            ),
          ),
          ),
          
        )),
        floatingActionButton: FloatingActionButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('tambah')));
            
        },
        child: Icon(Icons.add),
        tooltip: 'tambah',
        ),
    );
  }
}