import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/pages/primPassos.dart';
import 'package:flutter_hidrocultura/pages/quest1.dart';
import 'package:flutter_hidrocultura/pages/quest2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HidroCultura",
      debugShowCheckedModeBanner: false,
      home: Questinario1(),
      routes: {
        'quest1': (context) => Questinario1(),
        'quest2': (context) => Questinario2(),
        'primPassos': (context) => PrimeirosPassos(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //header
      body: Center(
        child: Image(image: AssetImage('assets/gota.png')),
      ),
    );
  }
}

//certo
