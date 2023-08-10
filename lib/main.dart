import 'package:flutter/material.dart';
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
      home: quest2(), //Home(),
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
      backgroundColor: Color.fromARGB(255, 210, 231, 194), //fundo
    );
  }
}
