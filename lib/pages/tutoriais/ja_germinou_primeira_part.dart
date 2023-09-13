
import 'package:flutter/material.dart';

class JaGerminouPP extends StatelessWidget {
  const JaGerminouPP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 210, 231, 194), //fundo
        body: SingleChildScrollView(
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
                              const SizedBox(
                                height: 60,
                              ),
                              const Text(
                                'Aplicação na estrutura',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 25),
                              ),
                              const SizedBox(
                                // aviso
                                height: 30,
                              ),
                              SizedBox(
                                width: 350,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(255, 255, 169, 71), backgroundColor: const Color.fromARGB(126, 249, 221, 96), elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'assets/imagens/atencao.png'),
                                        height: 25,
                                        width: 25,
                                      ),
                                      Text(
                                        "Dissolva a solução nutritiva na água.",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 350,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(255, 255, 169, 71), backgroundColor: const Color.fromARGB(126, 249, 221, 96), elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'assets/imagens/atencao.png'),
                                        height: 25,
                                        width: 25,
                                      ),
                                      Text(
                                        "Verifique se o sistema já está em funcionamento  ",
                                        style: TextStyle(
                                          fontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'problemasistema');
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                                child: const Text(
                                  'Problemas com o Sistema',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              const Text(
                                'Espuma Fenólica:',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset('assets/imagens/jaGerminei.png',
                                  width: 350, height: 250),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                '1. Assim que a planta apresentar o começo da germinação, posicione a espuma no sol, deixando sempre a espuma em um estado úmido;',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '2. Quando aparecer uma segunda folha, a muda estará pronta para ser transportada para o sistema;',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '3. Por último, posicione a unidade da espuma em um buraco presente no cano de suporte e espere a mágica acontecer.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                  width: 120,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'inicial');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: const Color.fromARGB(255, 30, 30, 30), backgroundColor: const Color.fromARGB(255, 180, 220, 156),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: const Row(children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Próximo",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ] //Row
                                          ))),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]))));
  }
}
