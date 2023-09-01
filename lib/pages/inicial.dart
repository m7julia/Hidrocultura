import 'dart:io';
import 'dart:ui';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/main.dart';
import 'package:flutter_hidrocultura/pages/monitorar/preview_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';
import 'package:tflite_v2/tflite_v2.dart';

class Inicial extends StatefulWidget {
  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  File? arquivo;
  File? img;

  showPreview(file) async {
    file = await Get.to(() => PreviewPage(file: file));
    img = file;

    if (file != null) {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  Widget infoObjeto(BuildContext context) {
    return new AlertDialog(
      content: Scaffold(
        body: Column(
          children: [
            Image.file(
              File(img!.path),
              fit: BoxFit.contain,
            ),
            _outputs != null
                ? Text(
                    _outputs![0]["label"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  bool _loading = false;
  List<dynamic>? _outputs;

  classifyImage(imagem) async {
    var out = await Tflite.runModelOnImage(
        path: imagem.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _loading = false;
      _outputs = out;
    });
  }

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
                                      image: AssetImage('assets/alface.png'),
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
                                  image:
                                      AssetImage('assets/icon_temperatura.png'),
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
                                      'assets/icon_luminosidade.png'),
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
                                  image: AssetImage('assets/icon_ph.png'),
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
                                  image: AssetImage('assets/icon_co2.png'),
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
                                  image: AssetImage('assets/icon_umidade.png'),
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
                                Get.to(
                                  () => CameraCamera(
                                      onFile: (file) => showPreview(file)),
                                );
                                classifyImage(img);
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
                                  image: AssetImage('assets/icon_camera.png'),
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
