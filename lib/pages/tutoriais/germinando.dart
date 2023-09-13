import 'package:flutter/material.dart';

class Germinando extends StatelessWidget {
  const Germinando({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 210, 231, 194), //fundo
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  const Card(
                    elevation: 0,
                    color: Colors.transparent,
                    surfaceTintColor: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Aguarde a germinação',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/imagens/germinando.png',
                      width: 250, height: 150),
                  const Text(
                    'A alface leva em média 6 dias para germinar.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                      width: 170,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'jaGerminouPP');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 30, 30, 30),
                            backgroundColor:
                                const Color.fromARGB(255, 180, 220, 156),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Row(children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Já germinou!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ] //Row
                              )))
                ]))));
  }
}
