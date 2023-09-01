import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/main.dart';

class JaGerminei extends StatefulWidget {
  @override
  State<JaGerminei> createState() => _JaGerminouState();
}

class _JaGerminouState extends State<JaGerminei> {
  String? value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 231, 194), //fundo
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 60),
                Text(
                  'Aplicar à estrutura:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40), //espaço entre paragrafos

                Container(
                    width: 350,
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 255, 240),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: [
                          DropdownMenuItem<String>(
                              value: "1",
                              child: Center(
                                child: Text("Espuma fenólica"),
                              )),
                          DropdownMenuItem<String>(
                              value: "2",
                              child: Center(
                                child: Text("Fibra de Coco"),
                              )),
                          DropdownMenuItem<String>(
                              value: "3",
                              child: Center(
                                child: Text("Algodão Hidrófilo"),
                              )),
                        ],
                        onChanged: (_value) => {
                          print(_value.toString()),
                          setState(() {
                            value = _value;
                          }),
                        },
                        hint: Text("Selecione o tipo de substrato"),
                        iconSize: 36,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        isExpanded: true,
                      ),
                    )),
                value == "1"
                    ? Card(
                        elevation: 0,
                        color: Colors.transparent,
                        surfaceTintColor: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 30), //espaço entre paragrafos
                            Text(
                              "Espuma fenólica:",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 30), //espaço entre paragrafos

                            Image(
                                image:
                                    AssetImage('assets/espumafenolica.jpeg')),
                            SizedBox(height: 30), //espaço entre paragrafos
                            Text(
                              '1. Lave a espuma em água corrente, esse passo serve para retirar resíduos de fabricação que ainda estão presentes na espuma;',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 30), //espaço entre paragrafos
                            Text(
                              '2. Faça furos de no máximo 1cm de diâmetro e 1 cm de profundidade na esponja, deixando espaçamentos entre eles, preferencialmente faça os furos de forma cônica para acomodar melhor as sementes;',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 30), //espaço entre paragrafos
                            Text(
                              '3. Coloque as sementes em cada furo até que encostem no fundo; Dependendo da  hortaliça pode ser necessário mais de uma semente por furo;',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 30), //espaço entre paragrafos
                            Text(
                              '4. Posicione a espuma com as sementes em um local sombreado, se certificando sempre da umidade da espuma, com o auxílio de um borrifador de água;',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text(" "),
                value == "2"
                    ? Card(
                        elevation: 0,
                        color: Colors.transparent,
                        surfaceTintColor: Colors.white,
                        child: Column(
                          children: [
                            Text(
                              "Fibra de Coco:",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 30), //espaço entre paragrafos
                            Text(
                              "Ops... ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            SizedBox(height: 10), //espaço entre paragrafos
                            Text(
                              "Esse tipo de de substrato ainda não esta disponível...",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            SizedBox(height: 30), //espaço entre paragrafos

                            Image(
                                image:
                                    AssetImage('assets/jardineiroTriste.png')),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    : Text(" "),
                value == "3"
                    ? Card(
                        elevation: 0,
                        color: Colors.transparent,
                        surfaceTintColor: Colors.white,
                        child: Column(
                          children: [
                            Text(
                              "Algodão Hidrófilo:",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 30), //espaço entre paragrafos
                            Text(
                              "Ops... ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            SizedBox(height: 10), //espaço entre paragrafos
                            Text(
                              "Esse tipo de de substrato ainda não esta disponível...",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            SizedBox(height: 30), //espaço entre paragrafos

                            Image(
                                image:
                                    AssetImage('assets/jardineiroTriste.png')),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    : Text(" "),

                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'quest2');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 180, 220, 156),
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child:
                              Text('Anterior', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      Container(
                        width: 40,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'inicial');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 180, 220, 156),
                                onPrimary: Color.fromARGB(255, 30, 30, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
