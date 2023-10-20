import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class Umidade extends StatefulWidget {
  String estadoPlanta;
  Umidade({required this.estadoPlanta});

  @override
  _UmidadeState createState() => _UmidadeState();
}

class _UmidadeState extends State<Umidade> {
  List<UmidadeData> _chartData = [];
  var valorSensor = 10;

  var maxUmiSaudavel;
  var minUmiSaudavel;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();

    if (widget.estadoPlanta == "Desenvolvimento Vegetativo") {
      maxUmiSaudavel = 70;
      minUmiSaudavel = 50;
    }
    if (widget.estadoPlanta == "Germinação") {
      maxUmiSaudavel = 90;
      minUmiSaudavel = 80;
    } else {
      maxUmiSaudavel = 60;
      minUmiSaudavel = 40;
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
                              Navigator.pushNamed(context, 'co2');
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
                              Navigator.pushNamed(context, 'temperatura');
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
                  'assets/imagens/icon_umidade.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Text(
                  'Umidade: $valorSensor %',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 10),
                // Está saudável!!!!!!
                SizedBox(
                  height: 50,
                  width: 200,
                  child: (valorSensor < minUmiSaudavel &&
                              valorSensor >= minUmiSaudavel - 10) ||
                          (valorSensor > maxUmiSaudavel &&
                              valorSensor <= maxUmiSaudavel + 10)
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
                      : (valorSensor >= minUmiSaudavel &&
                              valorSensor <= maxUmiSaudavel)
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
                  'Estes foram os níveis de luz de umidade do ambiente da planta nos últimos tempos:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                SfCartesianChart(
                    //Esse é o grafico hein
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<UmidadeData, String>>[
                      LineSeries<UmidadeData, String>(
                          dataSource: _chartData,
                          xValueMapper: (UmidadeData temp, _) => temp.dias,
                          yValueMapper: (UmidadeData temp, _) => temp.temp)
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
                        'O nível ideal de umidade para alfaces crespa em estado de germinação em um sistema hidropônico geralmente fica na faixa de 80% a 90%. Manter um ambiente com alta umidade relativa é importante para garantir que as sementes de alface crespa germinem com sucesso e que as plântulas cresçam de maneira saudável.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      )
                    : (widget.estadoPlanta == "Desenvolvimento Vegetativo")
                        ?
                        //estado crescimento vegetativo
                        const Text(
                            'O nível ideal de umidade para alfaces crespa em estado de crescimento em um sistema hidropônico geralmente varia entre 50% e 70% de umidade relativa. Manter a umidade dentro dessa faixa pode ajudar a criar um ambiente propício para o crescimento saudável das alfaces crespa, minimizando problemas como doenças fúngicas e excesso de umidade.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          )
                        :
                        //estado de colheita
                        const Text(
                            'O nível ideal de umidade para alfaces crespa em estado de colheita geralmente fica na faixa de 40% a 60% de umidade relativa. Isso porque durante a fase de colheita das alfaces crespa em um sistema hidropônico, é importante manter a umidade relativamente baixa para evitar problemas como a deterioração das folhas e o crescimento excessivo de fungos.',
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


/*
Germinação
80% a 90% == saudável
70% e 80% && 90% e 100% == sensível
<11.000 && >19.000 == enferma
*/

/*
crescimento vegetativo
50% e 70% == saudável
40% e 50% && 70% e 80% == sensível
<23.000 && >37.000 == enferma
*/

/*
colheita 
40% a 60% == saudável
30% e 40% && 60% e 70% == sensível
<11.000 && >19.000 == enferma
*/