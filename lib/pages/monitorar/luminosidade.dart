import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Luminosidade extends StatefulWidget {
  String estadoPlanta;
  Luminosidade({required this.estadoPlanta});

  @override
  _LuminosidadeState createState() => _LuminosidadeState();
}

class _LuminosidadeState extends State<Luminosidade> {
  List<LuminosidadeData> _chartData = [];
  var valorSensor = 0;

  var maxLumSaudavel;
  var minLumSaudavel;
  @override
  void initState() {
    var valorSensor = 3600;
    _chartData = getChartData();
    super.initState();

    if (widget.estadoPlanta == "Desenvolvimento Vegetativo") {
      maxLumSaudavel = 36000;
      minLumSaudavel = 24000;
    } else {
      maxLumSaudavel = 18000;
      minLumSaudavel = 12000;
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
                              Navigator.pushNamed(context, 'temperatura');
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
                              Navigator.pushNamed(context, 'ph');
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
                  'assets/imagens/icon_luminosidade.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Text(
                  'Luminosidade: $valorSensor lux',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: (valorSensor < minLumSaudavel &&
                              valorSensor >= minLumSaudavel - 1000) ||
                          (valorSensor > maxLumSaudavel &&
                              valorSensor <= maxLumSaudavel + 1000)
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
                      : (valorSensor >= minLumSaudavel &&
                              valorSensor <= maxLumSaudavel)
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
                  'Estes foram os níveis de luminosidade do ambiente da planta nos últimos tempos:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                SfCartesianChart(
                    //Esse é o grafico hein
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<LuminosidadeData, String>>[
                      LineSeries<LuminosidadeData, String>(
                          dataSource: _chartData,
                          xValueMapper: (LuminosidadeData lum, _) => lum.dias,
                          yValueMapper: (LuminosidadeData lum, _) => lum.lum)
                    ]),
                const SizedBox(height: 30),

                // Esse container é onde mostra o estágio da planta
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
                    ? Text(
                        'Durante a fase de germinação e quando as mudas estão em estágio de plântulas, uma intensidade luminosa mais baixa é suficiente. Cerca de 200-300 micro-moles de luz por metro quadrado por segundo (μmol/m²/s), o que equivale a aproximadamente 12.000-18.000 lux, pode ser adequado.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      )
                    : (widget.estadoPlanta == "Desenvolvimento Vegetativo")
                        ?

                        //estado crescimento vegetativo
                        const Text(
                            'Durante o estágio de crescimento vegetativo, as alfaces precisam de mais luz para desenvolver folhas saudáveis. Recomenda-se uma intensidade luminosa de aproximadamente 400-600 μmol/m²/s, o que equivale a cerca de 24.000-36.000 lux. Luzes brancas ou azuis (espectro de luz mais fria) são boas opções nesta fase.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          )
                        :
                        //estado de colheita
                        const Text(
                            'Durante a fase de colheita das alfaces crespa em um sistema hidropônico, a luminosidade ideal ainda é importante para manter a qualidade das folhas. A intensidade luminosa adequada pode ajudar a manter a cor, textura e sabor das folhas. Para alfaces crespa em estado de colheita, recomenda-se uma intensidade luminosa na faixa de 200 a 400 micro-moles de luz por metro quadrado por segundo (μmol/m²/s), o que equivale a aproximadamente 12.000 a 24.000 lux. Geralmente, fornecer de 12 a 16 horas de luz por dia é apropriado para a fase de crescimento e colheita de alfaces crespa.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          ),
              ],
            ),
          ),
        ));
  }

  List<LuminosidadeData> getChartData() {
    final List<LuminosidadeData> chartData = [
      LuminosidadeData(2800, 'Dia 1'),
      LuminosidadeData(2660, 'Dia 2'),
      LuminosidadeData(2400, 'Dia 3'),
      LuminosidadeData(2200, 'Dia 4'),
      LuminosidadeData(2800, 'Dia 5'),
    ];
    return chartData;
  }
}

class LuminosidadeData {
  LuminosidadeData(this.lum, this.dias);
  final double lum;
  final String dias;
}


/*
Germinação
12.000 a 18.000 == saudável
11.000 a 12.000 && 18.000 a 19.000 == sensível
<11.000 && >19.000 == enferma
*/

/*
crescimento vegetativo
24.000 a 36.000 == saudável
23.000 a 24.000 && 36.000 a 37.000 == sensível
<23.000 && >37.000 == enferma
*/

/*
colheita 
12.000 a 18.000 == saudável
11.000 a 12.000 && 18.000 a 19.000 == sensível
<11.000 && >19.000 == enferma
*/