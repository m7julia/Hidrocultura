import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class Umidade extends StatefulWidget {
  const Umidade({super.key});

  @override
  _UmidadeState createState() => _UmidadeState();
}

class _UmidadeState extends State<Umidade> {
  List<UmidadeData> _chartData = [];

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
                              Navigator.pushNamed(context, 'co2');
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
                              Navigator.pushNamed(context, 'temperatura');
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
                  'assets/imagens/icon_umidade.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Umidade: 60%',
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
