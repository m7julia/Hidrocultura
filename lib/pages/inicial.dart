import 'dart:io';
import 'dart:ui';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';
import 'package:tflite_v2/tflite_v2.dart';

class Inicial extends StatefulWidget {
  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 231, 194), //fundo
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
                            Text(
                              'Monitoramento:',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  //primary: Color.fromARGB(126, 249, 221, 96),
                                  onPrimary: Color.fromARGB(255, 19, 73, 25),
                                  primary: Color.fromARGB(255, 210, 231, 194),
                                ),
                                child: Row(
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
                                  elevation: 0,
                                  //primary: Color.fromARGB(126, 249, 221, 96),
                                  onPrimary: Color.fromARGB(255, 19, 73, 25),
                                  primary: Color.fromARGB(255, 210, 231, 194),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Estágio inicial de Crescimento",
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
                              onPressed: () {
                                Navigator.pushNamed(context, 'temperatura');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Colors.black54,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image: AssetImage(
                                      'assets/imagens/icon_temperatura.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "Temperatura",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "22°C",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                              onPressed: () {
                                Navigator.pushNamed(context, 'luminosidade');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Colors.black54,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image: AssetImage(
                                      'assets/imagens/icon_luminosidade.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "Luminosidade",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "2.500 lux",
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
                SizedBox(
                  width: 300,
                  height: 130,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'ph');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Colors.black54,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image:
                                      AssetImage('assets/imagens/icon_ph.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "PH",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "6,2",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                              onPressed: () {
                                Navigator.pushNamed(context, 'co2');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Colors.black54,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image:
                                      AssetImage('assets/imagens/icon_co2.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "CO2",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "1220ppm",
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
                              onPressed: () {
                                Navigator.pushNamed(context, 'umidade');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Colors.black54,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image: AssetImage(
                                      'assets/imagens/icon_umidade.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "Umidade",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "60%",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Colors.black54,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
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
