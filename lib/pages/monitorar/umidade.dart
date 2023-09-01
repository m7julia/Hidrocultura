import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/main.dart';
import 'package:flutter_hidrocultura/pages/monitorar/preview_page.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Umidade extends StatefulWidget {
  @override
  _UmidadeState createState() => _UmidadeState();
}

class _UmidadeState extends State<Umidade> {
  List<UmidadeData> _chartData = [];

  File? arquivo;

  showPreview(file) async {
    file = await Get.to(() => PreviewPage(file: file));

    if (file != null) {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 231, 194), //fundo
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Card(
                  //Botoes -->>
                  elevation: 0,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'co2');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 180, 220, 156),
                                onPrimary: Colors.black,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10)),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color.fromARGB(255, 120, 144, 72),
                              size: 15.0,
                            )),
                      ),
                      Container(
                        width: 220,
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'temperatura');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 180, 220, 156),
                                onPrimary: Colors.black,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10)),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 120, 144, 72),
                              size: 15.0,
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/icon_umidade.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  'Umidade: 60%',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 10),
                // Está saudável!!!!!!
                Container(
                  height: 50,
                  width: 200,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Saudável!",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        'assets/checkgood.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Estes foram os níveis de luz de umidade do ambiente da planta nos últimos tempos:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),

                SfCartesianChart(
                    //Esse é o grafico hein
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<UmidadeData, String>>[
                      LineSeries<UmidadeData, String>(
                          dataSource: _chartData,
                          xValueMapper: (UmidadeData temp, _) => temp.dias,
                          yValueMapper: (UmidadeData temp, _) => temp.temp)
                    ]),
                SizedBox(height: 30),

                // Esse container é onde mostra o estágio da planta e tem o botão do lado
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 180, 220, 156),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 90,
                  width: 500,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Sua planta está no: \n"
                        "Estágio inicial de crescimento",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => Get.to(
                                    () => CameraCamera(
                                        onFile: (file) => showPreview(file)),
                                  ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Column(children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Image(
                                  image: AssetImage('assets/icon_camera.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Verificar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                //Tex
                              ] //Row
                                  ))),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'A medida que as mudas começam a crescer, a umidade relativa do ar pode ser ligeiramente reduzida para incentivar o desenvlvimento de raízes saudáveis e minimizar o risco de doenças fúngicas. Umaumidade relativa do ar de cerca de 60% a 70% é adequada para essa fase.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ));
  }

  List<UmidadeData> getChartData() {
    final List<UmidadeData> chartData = [
      UmidadeData(28, 'Dia 1'),
      UmidadeData(26, 'Dia 2'),
      UmidadeData(24, 'Dia 3'),
      UmidadeData(22, 'Dia 4'),
      UmidadeData(28, 'Dia 5'),
    ];
    return chartData;
  }
}

class UmidadeData {
  UmidadeData(this.temp, this.dias);
  final double temp;
  final String dias;
}
