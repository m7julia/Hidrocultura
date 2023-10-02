import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/pages/monitorar/co2.dart';
import 'package:flutter_hidrocultura/pages/monitorar/luminosidade.dart';
import 'package:firebase_database/firebase_database.dart';

class Inicial extends StatefulWidget {
  String estadoPlanta;
  Inicial({required this.estadoPlanta});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
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
                              onPressed: () {
                                Navigator.pushNamed(context, 'temperatura');
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
                              onPressed: () => mandarInfosLum(),
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
                                foregroundColor: Colors.black54,
                                backgroundColor:
                                    const Color.fromARGB(255, 247, 255, 240),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Column(children: [
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
                              onPressed: () => mandarInfosCo2(),
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
