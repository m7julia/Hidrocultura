import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

class Co2 extends StatefulWidget {
  String estadoPlanta;
  Co2({required this.estadoPlanta});

  @override
  _Co2State createState() => _Co2State();
}

final _database = FirebaseDatabase.instance.ref();
var _jsonString = '';

class _Co2State extends State<Co2> {
  String _valorSensor = '1000';
  List<Co2Data> _chartData = [];

  void _activateListeners() async {
    _database.child("co2/agora").onValue.listen((event) {
      final String valorSensor = event.snapshot.value.toString();
      setState(() {
        _valorSensor = valorSensor.substring(21, valorSensor.length - 1);
      });
    });

    _database.child("co2/todos").onValue.listen((event) {
      final Map<dynamic, dynamic>? dataCo2 =
          event.snapshot.value as Map<dynamic, dynamic>?;
      if (dataCo2 != null) {
        setState(() {
          parseObjectReceivetoCo2Data(dataCo2);
        });
      }
    });
  }

  void parseObjectReceivetoCo2Data(Map<dynamic, dynamic>? object) {
    if (object == null) return;
    List<Co2Data> charData = [];

    object.forEach((key, value) {
      Co2Data current = Co2Data(double.parse(value.toString()), '$key');
      charData.add(current);
    });

    setState(() => {_chartData = charData});
  }

  final _database = FirebaseDatabase.instance.ref();

  var valorSensor = 0;

  var maxCo2Saudavel;

  @override
  void initState() {
    super.initState();
    valorSensor = 0;

    _activateListeners();

    // try {
    //   parseJsonToList(_jsonString);
    //   //_chartData = await parseJsonToList(_jsonString);
    // } catch (error) {
    //   _chartData = getChartData();
    //   print('linha 54 $_jsonString');
    // }

    if (widget.estadoPlanta == "Desenvolvimento Vegetativo") {
      maxCo2Saudavel = 800;
    } else {
      maxCo2Saudavel = 500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 210, 231, 194), //fundo
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                Card(
                  //Botoes -->>
                  elevation: 0,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'ph');
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor:
                                    const Color.fromARGB(255, 180, 220, 156),
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(10)),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color.fromARGB(255, 120, 144, 72),
                              size: 20.0,
                            )),
                      ),
                      Container(
                        width: 80,
                      ),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'inicial');
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor:
                                    const Color.fromARGB(255, 180, 220, 156),
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(10)),
                            child: const Icon(
                              Icons.home_rounded,
                              color: Color.fromARGB(255, 120, 144, 72),
                              size: 25.0,
                            )),
                      ),
                      Container(
                        width: 80,
                      ),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'umidade');
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor:
                                    const Color.fromARGB(255, 180, 220, 156),
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(10)),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 120, 144, 72),
                              size: 20.0,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Image.asset(
                  'assets/imagens/icon_co2.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                Text(
                  'CO2: $_valorSensor ppm',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 200,
                  //sensivel
                  child: (valorSensor < 300 && valorSensor >= 200) ||
                          (valorSensor > maxCo2Saudavel &&
                              valorSensor <= maxCo2Saudavel + 100)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Sensivel!",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              'assets/imagens/sensivel.png',
                              width: 40,
                              height: 40,
                            ),
                          ],
                        )
                      : (valorSensor >= 300 && valorSensor <= maxCo2Saudavel)
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Saudável
                                const Text(
                                  "Saudável!",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset(
                                  'assets/imagens/checkgood.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Enferma!",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset(
                                  'assets/imagens/enferma.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ],
                            ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Estes foram os níveis de CO2 do ambiente da planta nos últimos tempos:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                SfCartesianChart(
                    //Esse é o grafico hein
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<Co2Data, String>>[
                      LineSeries<Co2Data, String>(
                          dataSource: _chartData,
                          xValueMapper: (Co2Data co2, _) => co2.dias,
                          yValueMapper: (Co2Data co2, _) => co2.co2)
                    ]),
                const SizedBox(height: 30),

                // Esse container é onde mostra o estágio da planta e tem o botão do lado
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 180, 220, 156),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 90,
                  width: 500,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Sua planta está em:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.estadoPlanta,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                //estado germinando
                (widget.estadoPlanta == "Germinação")
                    ? const Text(
                        'O nível ideal de dióxido de carbono (CO2) para o cultivo de alfaces em estado de germinação pode variar, mas em geral, é aconselhável manter os níveis de CO2 em torno de 300ppm a 500ppm.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      )
                    : (widget.estadoPlanta == "Desenvolvimento Vegetativo")
                        ?

                        //estado crescimento vegetativo
                        const Text(
                            'Durante o crescimento vegetativo das alfaces, os níveis ideais de dióxido de carbono (CO2) podem variar, mas geralmente são mantidos em torno de 300ppm a 800ppm. ',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          )
                        :

                        //estado de colheita
                        const Text(
                            'durante o estágio de colheita, os níveis de CO2 podem ser mantidos em torno de 300ppm a 500ppm, que é a faixa típica de CO2 encontrada no ar ambiente. ',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          )
              ],
            ),
          ),
        ));
  }

  List<Co2Data> getChartData() {
    final List<Co2Data> chartData = [
      Co2Data(double.parse(_valorSensor), 'Dia 1'),
      Co2Data(1200, 'Dia 2'),
      Co2Data(1220, 'Dia 3'),
      Co2Data(1250, 'Dia 4'),
      Co2Data(1300, 'Dia 5'),
    ];
    return chartData;
  }
}

class Co2Data {
  Co2Data(this.co2, this.dias);
  final double co2;
  final String dias;
}

Future<List<Co2Data>> parseJsonToList(String jsonString) async {
  print('String Json no método $jsonString');
  print('passando');
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  List<Co2Data> dataObjects = [];
  jsonMap.forEach((key, value) {
    dataObjects.add(Co2Data(value, key));
  });
  print('_dataObjects linha 347');
  //return dataObjects;
  return dataObjects;
}



//Anotações:
/*
Se esta germinando:
de 300ppm a 500ppm == saudavel 
de 300 a 200 || 500 a 600 == sensivel
<200 a >600 == enferma*/

/* 
se estado vegetativo:
de 300ppm a 800ppm == saudavel 
de 300 a 200 && 800 a 900 == sensivel
<200 a >900 == enferma*/

/* 
se estado colheita:
de 300ppm a 500ppm == saudavel 
de 300 a 200 && 500 a 600 == sensivel
<200 a >600 == enferma*/


