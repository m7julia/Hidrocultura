import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/pages/germinando.dart';
import 'package:flutter_hidrocultura/pages/inicial.dart';
import 'package:flutter_hidrocultura/pages/jaGerminouPP.dart';
import 'package:flutter_hidrocultura/pages/primPassos.dart';
import 'package:flutter_hidrocultura/pages/quest1.dart';
import 'package:flutter_hidrocultura/pages/quest2.dart';
import 'package:flutter_hidrocultura/pages/jaGerminei.dart';
import 'package:flutter_hidrocultura/pages/problemasistema.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HidroCultura",
      debugShowCheckedModeBanner: false,
      home: Questionario1(),
      routes: {
        'quest1': (context) => Questionario1(),
        'quest2': (context) => Questionario2(),
        'primPassos': (context) => PrimeirosPassos(),
        'jaGerminei': (context) => JaGerminei(),
        'germinando': (context) => Germinando(),
        'inicial': (context) => Inicial(),
        'jaGerminouPP': (context) => JaGerminouPP(),
        'problemasistema':(context) => ProblemaSistema(),
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
