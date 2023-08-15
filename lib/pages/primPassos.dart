import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/main.dart';

class PrimeirosPassos extends StatefulWidget {
  @override
  State<PrimeirosPassos> createState() => _PrimeirosPassosState();
}

class _PrimeirosPassosState extends State<PrimeirosPassos> {
  final items = ['Algodão Higrófilo', 'Espuma Fenólica', 'Fibra de Coco'];

  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 231, 194), //fundo
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment
              //  .spaceEvenly, // distribui o espaço igualmente (pode vir a ser tirado mais tarde)
              children: [
                SizedBox(height: 60),
                Text(
                  'Primeiros passos:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40), //espaço entre paragrafos
                Text(
                  'Antes de mais nada, é essencial que você avalie a procedência das sementes que serão usadas.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Image(
                            image: AssetImage('assets/primeirospassos.png')),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Busque variedades que se adaptem bem ao clima e objetivo final do cultivo, tanto em termos de quantidade como qualidade.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5), //espaço entre paragrafos
                Text(
                  'Além disso, utilize sementes feminizadas e evite ao máximo o uso de sementes de prensado.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 40), //espaço entre paragrafos
                Text(
                  'Tipos de Substratos',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30), //espaço entre paragrafos
                Text(
                  'Para o cultivo hidropônico existem diversos tipos de substratos que podem ser utilizados, aqui temos algumas sugestões:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30), //espaço entre paragrafos
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
                        value: value,
                        iconSize: 36,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        isExpanded: true,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.value = value),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
