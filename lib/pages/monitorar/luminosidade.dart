import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Luminosidade extends StatefulWidget {
  const Luminosidade({super.key});

  @override
  _LuminosidadeState createState() => _LuminosidadeState();
}

class _LuminosidadeState extends State<Luminosidade> {
  List<LuminosidadeData> _chartData = [];

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
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
                              Navigator.pushNamed(context, 'temperatura');
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 180, 220, 156),
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
                              Navigator.pushNamed(context, 'ph');
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 180, 220, 156),
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
                  'assets/imagens/icon_luminosidade.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Luminosidade: 2.500 lux',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 10),
                // Está saudável!!!!!!
                SizedBox(
                  height: 50,
                  width: 200,
                  child: Row(
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
                      const SizedBox(
                        width: 25,
                      ),
                      const Text(
                        "Sua planta está no: \n"
                        "Estágio inicial de crescimento",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Column(children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/imagens/icon_camera.png'),
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
                const SizedBox(height: 30),
                const Text(
                  'À medida que as mudas de alface começam a crescer, é necessário aumentar a intensidade da luz. Recomenda-se uma luminosidade de cerca de 2.000 a 3.000 lux.',
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
