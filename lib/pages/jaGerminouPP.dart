import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/main.dart';

class JaGerminouPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 231, 194), //fundo
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
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Aplicação na estrutura',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Espuma Fenólica:',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset('assets/jaGerminei.png',
                                  width: 350, height: 250),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '1. Assim que a planta apresentar o começo da germinação, posicione a espuma no sol, deixando sempre a espuma em um estado úmido;',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '2. Quando aparecer uma segunda folha, a muda estará pronta para ser transportada para o sistema;',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '3. Por último, posicione a unidade da espuma em um buraco presente no cano de suporte e espere a mágica acontecer.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
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
                                        primary:
                                            Color.fromARGB(255, 180, 220, 156),
                                        onPrimary:
                                            Color.fromARGB(255, 30, 30, 30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Row(children: [
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
                                          SizedBox(height: 20,),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 120,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'germinando');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 180, 220, 156),
                                    onPrimary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text('Anterior',
                                      style: TextStyle(fontSize: 18)),
                                ),
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
