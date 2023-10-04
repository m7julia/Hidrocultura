import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Ph extends StatefulWidget {
  String estadoPlanta;
  Ph({required this.estadoPlanta});

  @override
  _PhState createState() => _PhState();
}

class _PhState extends State<Ph> {
  List<PhData> _chartData = [];
  var valorSensor = 6.7;

  var maxPhSaudavel;
  var minPhSaudavel;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();

    if (widget.estadoPlanta == "Desenvolvimento Vegetativo") {
      maxPhSaudavel = 6.5;
      minPhSaudavel = 5.8;
    }
    if (widget.estadoPlanta == "Germinação") {
      maxPhSaudavel = 6.5;
      minPhSaudavel = 5.5;
    } else {
      maxPhSaudavel = 6.0;
      minPhSaudavel = 5.5;
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
                              Navigator.pushNamed(context, 'luminosidade');
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
                              Navigator.pushNamed(context, 'co2');
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
                  'assets/imagens/icon_ph.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Text(
                  'Ph $valorSensor ',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 10),
                // Está saudável!!!!!!
                SizedBox(
                  height: 50,
                  width: 200,
                  child: (valorSensor < minPhSaudavel &&
                              valorSensor >= minPhSaudavel - 1.0) ||
                          (valorSensor > maxPhSaudavel &&
                              valorSensor <= maxPhSaudavel + 1.0)
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
                      : (valorSensor >= minPhSaudavel &&
                              valorSensor <= maxPhSaudavel)
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
                  'Estes foram os níveis de PH do ambiente da planta nos últimos tempos:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                SfCartesianChart(
                    //Esse é o grafico hein
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<PhData, String>>[
                      LineSeries<PhData, String>(
                          dataSource: _chartData,
                          xValueMapper: (PhData ph, _) => ph.dias,
                          yValueMapper: (PhData ph, _) => ph.ph)
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
                        'Durante o estágio inicial de crescimento das mudas, o pH recomendado é de 5,5 a 6,5. Manter o pH nessa faixa ajuda a garantir a absorção adequada de nutrientes essenciais para o desenvolvimento das raízes e o crescimento das folhas.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      )
                    : (widget.estadoPlanta == "Desenvolvimento Vegetativo")
                        ?
                        //estado crescimento vegetativo
                        const Text(
                            'Durante o desenvolvimento vegetativo do alface na hidroponia, o nível de pH ideal também está na faixa de 5,5 a 6,5, assim como na fase de germinação. Manter o pH dentro dessa faixa é importante para garantir a absorção adequada de nutrientes pelas plantas, o que é essencial para o crescimento saudável das alfaces.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          )
                        :
                        //estado de colheita
                        const Text(
                            'Durante a fase de colheita das alfaces na hidroponia, o pH da solução nutritiva não é tão crítico quanto nas fases de germinação e crescimento vegetativo. Neste estágio, o pH pode ser mantido na faixa de 5,5 a 6,5, que é a mesma faixa recomendada para o desenvolvimento vegetativo, pois ainda é uma faixa geralmente aceitável para a absorção de nutrientes pelas plantas.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          ),
              ],
            ),
          ),
        ));
  }

  List<PhData> getChartData() {
    final List<PhData> chartData = [
      PhData(6.2, 'Dia 1'),
      PhData(4.0, 'Dia 2'),
      PhData(2.4, 'Dia 3'),
      PhData(2.8, 'Dia 4'),
      PhData(6.0, 'Dia 5'),
    ];
    return chartData;
  }
}

class PhData {
  PhData(this.ph, this.dias);
  final double ph;
  final String dias;
}

//Anotações:
/*
Se esta germinando:
de 5,5 a 6,5 == saudavel 
de  4,5 a 5,5 || 6,5 a 7,5 == sensivel
<4,5 a >7,5 == enferma*/

/* 
se estado vegetativo:
de 5,8 a 6,5 == saudavel 
de  4,8 a 5,8 || 6,5 a 7,5 == sensivel
<4,8 a >7,5 == enferma*/

/* 
se estado colheita:
de 5,5 a 6,0 == saudavel 
de  4,5 a 5,5 || 6,0 a 7,0 == sensivel
<4,5 a >7,0 == enferma*/


