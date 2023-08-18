import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/main.dart';

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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'germinando');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Color.fromARGB(255, 30, 30, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image:
                                      AssetImage('assets/icon_temperatura.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "Temperatura",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
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
                                Navigator.pushNamed(context, 'germinando');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Color.fromARGB(255, 30, 30, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image:
                                      AssetImage('assets/icon_luminosidade.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "Luminosidade",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
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
                Card(
                    elevation: 0,
                    color: Colors.transparent,
                    surfaceTintColor: Colors.white,
                    child: Row(children: <Widget>[
                      Container(
                        width: 40,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'germinando');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Color.fromARGB(255, 30, 30, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image:
                                      AssetImage('assets/icon_ph.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "PH",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
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
                                Navigator.pushNamed(context, 'germinando');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Color.fromARGB(255, 30, 30, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image:
                                      AssetImage('assets/icon_co2.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "CO2",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "1220ppm",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ), //Tex
                              ])))
                    ])),
                Card(
                    elevation: 0,
                    color: Colors.transparent,
                    surfaceTintColor: Colors.white,
                    child: Row(children: <Widget>[
                      Container(
                        width: 40,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'germinando');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Color.fromARGB(255, 30, 30, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image:
                                      AssetImage('assets/icon_umidade.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "Umidade",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
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
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'germinando');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 247, 255, 240),
                                onPrimary: Color.fromARGB(255, 30, 30, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(children: [
                                Image(
                                  image:
                                      AssetImage('assets/icon_camera.png'),
                                  height: 70,
                                  width: 50,
                                ),
                                Text(
                                  "Verificar estado",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ), //Text
                              ]))), //collumn
                    ]) //expanded

                    )
              ]),
        ),
      ),
    );
  }
}
