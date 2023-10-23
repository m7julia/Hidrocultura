// import 'dart:async';
// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/pages/monitorar/co2.dart';
import 'package:flutter_hidrocultura/pages/monitorar/luminosidade.dart';
import 'package:flutter_hidrocultura/pages/monitorar/ph.dart';
import 'package:flutter_hidrocultura/pages/monitorar/temperatura.dart';
import 'package:flutter_hidrocultura/pages/monitorar/umidade.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_core/firebase_core.dart';
// import '../firebase_options.dart';

class Inicial extends StatefulWidget {
  String estadoPlanta;
  Inicial({required this.estadoPlanta});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  String _temperature = "conectando...";
  String _co2 = "conectando...";
  String _luminosity = "conectando...";
  String _ph = "conectando...";
  String _humidity = "conectando...";

  final _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    _database.child("temperatura/agora").onValue.listen((event) {
      final String temperatura = event.snapshot.value.toString();
      setState(() {
        _temperature = temperatura.substring(21, temperatura.length - 1);
      });
    });
    _database.child("co2/agora").onValue.listen((event) {
      final String co2 = event.snapshot.value.toString();
      setState(() {
        _co2 = co2.substring(21, co2.length - 1);
      });
    });
    _database.child("luminosidade/agora").onValue.listen((event) {
      final String luminosidade = event.snapshot.value.toString();
      setState(() {
        _luminosity = luminosidade.substring(21, luminosidade.length - 1);
      });
    });
    _database.child("ph/agora").onValue.listen((event) {
      final String ph = event.snapshot.value.toString();
      setState(() {
        _ph = ph.substring(21, ph.length - 1);
      });
    });
    _database.child("umidade/agora").onValue.listen((event) {
      final String umidade = event.snapshot.value.toString();
      setState(() {
        _humidity = umidade.substring(21, umidade.length - 1);
      });
    });
  }

  // Co2
  void mandarInfosCo2() {
    late String estadoPlanta;

    setState(() {
      if (widget.estadoPlanta != null) estadoPlanta = widget.estadoPlanta;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Co2(estadoPlanta: estadoPlanta)));
    });
  }

  // luminosidade
  void mandarInfosLum() {
    late String estadoPlanta;

    setState(() {
      if (widget.estadoPlanta != null) estadoPlanta = widget.estadoPlanta;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Luminosidade(estadoPlanta: estadoPlanta)));
    });
  }

  //ph
  void mandarInfosPh() {
    late String estadoPlanta;

    setState(() {
      if (widget.estadoPlanta != null) estadoPlanta = widget.estadoPlanta;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Ph(estadoPlanta: estadoPlanta)));
    });
  }

  // temperatura
  void mandarInfosTemp() {
    late String estadoPlanta;

    setState(() {
      if (widget.estadoPlanta != null) estadoPlanta = widget.estadoPlanta;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Temperatura(estadoPlanta: estadoPlanta)));
    });
  }

  // umidade
  void mandarInfosUmi() {
    late String estadoPlanta;

    setState(() {
      if (widget.estadoPlanta != null) estadoPlanta = widget.estadoPlanta;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Umidade(estadoPlanta: estadoPlanta)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 231, 194), //fundo
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: <Widget>[
                            const Text(
                              'Monitoramento:',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 19, 73, 25),
                                  backgroundColor:
                                      const Color.fromARGB(255, 210, 231, 194),
                                  elevation: 0,
                                ),
                                child: const Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/imagens/alface.png'),
                                      height: 40,
                                      width: 40,
                                    ),
                                    Text(
                                      "Plantação de Alface",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 19, 73, 25),
                                  backgroundColor:
                                      const Color.fromARGB(255, 210, 231, 194),
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      widget.estadoPlanta,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 130,
                  /*elevation: 0,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.white,*/

                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => mandarInfosTemp(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black54,
                                backgroundColor:
                                    const Color.fromARGB(255, 247, 255, 240),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/imagens/icon_temperatura.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                const Text(
                                  "Temperatura",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "$_temperature°C",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ), //Tex
                              ] //Row
                                  ))),
                      Container(
                        width: 40,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => mandarInfosLum(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black54,
                                backgroundColor:
                                    const Color.fromARGB(255, 247, 255, 240),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/imagens/icon_luminosidade.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                const Text(
                                  "Luminosidade",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "$_luminosity lux",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ), //Tex
                              ] //Row
                                  ))),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 130,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => mandarInfosPh(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black54,
                                backgroundColor:
                                    const Color.fromARGB(255, 247, 255, 240),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                const Image(
                                  image:
                                      AssetImage('assets/imagens/icon_ph.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                const Text(
                                  "PH",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  _ph,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ), //Tex
                              ] //Row
                                  ))),
                      Container(
                        width: 40,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => mandarInfosCo2(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black54,
                                backgroundColor:
                                    const Color.fromARGB(255, 247, 255, 240),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                const Image(
                                  image:
                                      AssetImage('assets/imagens/icon_co2.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                const Text(
                                  "CO2",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "$_co2 ppm",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ), //Tex
                              ] //Row
                                  ))),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 130,
                  /*elevation: 0,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.white,*/

                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => mandarInfosUmi(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black54,
                                backgroundColor:
                                    const Color.fromARGB(255, 247, 255, 240),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/imagens/icon_umidade.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                const Text(
                                  "Umidade",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "$_humidity%",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ), //Tex
                              ] //Row
                                  ))),
                      Container(
                        width: 40,
                      ),
                      //Botão verificar estado
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'camera');
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black54,
                                backgroundColor:
                                    const Color.fromARGB(255, 247, 255, 240),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Column(children: [
                                Image(
                                  image: AssetImage(
                                      'assets/imagens/icon_camera.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "Verificar estado",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ), //Tex
                              ] //Row
                                  ))),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
