import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Temperatura extends StatefulWidget {
  String estadoPlanta;
  Temperatura({required this.estadoPlanta});

  @override
  _TemperaturaState createState() => _TemperaturaState();
}

class _TemperaturaState extends State<Temperatura> {
  List<TemperaturaData> _chartData = [];
  var valorSensor = 0;

  var maxTempSaudavel;
  var minTempSaudavel;

  var nika;

  late Timer _timer;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();

    if (widget.estadoPlanta == "Desenvolvimento Vegetativo") {
      maxTempSaudavel = 22;
      minTempSaudavel = 15;
    }
    if (widget.estadoPlanta == "Germinação") {
      maxTempSaudavel = 25;
      minTempSaudavel = 15;
    } else {
      maxTempSaudavel = 22;
      minTempSaudavel = 18;
    }

    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      // Generate a random double between 0.0 and 1.0
      valorSensor = Random().nextInt(45);

      // Update the UI to reflect the new value
      setState(() {});
    });
  }

  // void _mudarValorSensor() {
  //   setState(() {
  //     _timer = Timer.periodic(Duration(seconds: 2), (timer) {
  //       valorSensor = Random().nextInt(100);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 210, 231, 194), //fundo
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
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
                              Navigator.pushNamed(context, 'umidade');
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
                              Navigator.pushNamed(context, 'luminosidade');
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
                SizedBox(height: 25),
                Image.asset(
                  'assets/imagens/icon_temperatura.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Text(
                  'Temperatura: $valorSensor °C',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: (valorSensor < minTempSaudavel &&
                              valorSensor >= minTempSaudavel - 5) ||
                          (valorSensor > maxTempSaudavel &&
                              valorSensor <= maxTempSaudavel + 5)
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
                      : (valorSensor >= minTempSaudavel &&
                              valorSensor <= maxTempSaudavel)
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                  'Estes foram os níveis de luz do ambiente da planta nos últimos tempos:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                SfCartesianChart(
                    //Esse é o grafico hein
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<TemperaturaData, String>>[
                      LineSeries<TemperaturaData, String>(
                          dataSource: _chartData,
                          xValueMapper: (TemperaturaData temp, _) => temp.dias,
                          yValueMapper: (TemperaturaData temp, _) => temp.temp)
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
                (widget.estadoPlanta == "Germinação")
                    ? Text(
                        'O nível de temperatura ideal para alfaces em estado de germinação na hidroponia varia um pouco, mas geralmente está na faixa de 20°C a 24°C graus Celsius. Essa faixa de temperatura é considerada ótima para a germinação das sementes de alface.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      )
                    : (widget.estadoPlanta == "Desenvolvimento Vegetativo")
                        ?
                        //estado crescimento vegetativo
                        const Text(
                            'A faixa de temperatura recomendada fica entre 18°C a 22°C. Manter a temperatura dentro dessa faixa é importante para promover o crescimento saudável das alfaces.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          )
                        :
                        //estado de colheita
                        const Text(
                            'Manter as alfaces em temperaturas mais baixas, como entre 10 e 18°C, antes da colheita pode ajudar a retardar o crescimento e o amadurecimento das plantas, o que pode ser útil se você deseja garantir a qualidade das alfaces até o momento da colheita.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          ),
              ],
            ),
          ),
        ));
  }

  List<TemperaturaData> getChartData() {
    final List<TemperaturaData> chartData = [
      TemperaturaData(28, 'Dia 1'),
      TemperaturaData(26, 'Dia 2'),
      TemperaturaData(24, 'Dia 3'),
      TemperaturaData(22, 'Dia 4'),
      TemperaturaData(28, 'Dia 5'),
    ];
    return chartData;
  }
}

class TemperaturaData {
  TemperaturaData(this.temp, this.dias);
  final double temp;
  final String dias;
}

/*
Germinação
15 a 25 == saudável
10 a 15 && 25 a 30 == sensível
<10 && >30 == enferma
*/

/*
crescimento vegetativo
15°C a 22°C == saudável
10 a 15 && 22 a 27 == sensível
<10 && >27 == enferma
*/

/*
colheita 
18 a 22 == saudável
13 a 18 && 22 a 27 == sensível
<13 && >27 == enferma
*/