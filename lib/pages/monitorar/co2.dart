import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class Co2 extends StatefulWidget {
  String estadoPlanta;
  Co2({required this.estadoPlanta});

  @override
  _Co2State createState() => _Co2State();
}

class _Co2State extends State<Co2> {
  List<Co2Data> _chartData = [];
  var valorSensor = 0;

  var maxCo2Saudavel;
  @override
  void initState() {
    valorSensor = 100;
    _chartData = getChartData();
    super.initState();

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
                const SizedBox(height: 10),
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
                              size: 15.0,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/imagens/icon_co2.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                Text(
                  'CO2: $valorSensor ppm',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: (valorSensor < 300 && valorSensor >= 200) ||
                          (valorSensor > maxCo2Saudavel &&
                              valorSensor <= maxCo2Saudavel + 100)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sensivel!",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
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
                                Text(
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
                          Text(
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
      Co2Data(1200, 'Dia 1'),
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
de 300 a 200 && 500 a 600 == sensivel.

<200 a >600 == enferma*/


