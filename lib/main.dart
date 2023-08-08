import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold( //header
        backgroundColor: Color.fromARGB(255, 210,231,194), //fundo
        appBar: AppBar( 
          title: Text("Hidrocultura"),
          backgroundColor: Color.fromARGB(255, 132,188,114), //cabeçalhoflutter
        ),
        

   )
    );
  }
}
