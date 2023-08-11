import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/main.dart';

class PrimeirosPassos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 231, 194), //fundo
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
                child: Column(
              children: <Widget>[
                Text(
                  'Primeiros passos:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'Antes de mais nada, é essencial que você avalie a procedência das sementes que serão usadas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                Image(image: AssetImage('assets/primeirospassos.png')),
                Text(
                  'Busque variedades que se adaptem bem ao clima e objetivo final do cultivo, tanto em termos de quantidade como qualidade. Além disso, utilize sementes feminizadas e evite ao máximo o uso de sementes de prensado.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                Text('Tipos de Substrato:',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),),
                Text('Para o cultivo hidropônico existem diversos tipos de substratos que podem ser utilizados, aqui temos algumas sugestões:',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),),
              ]
            ),
          )
            ));
  }
}
