import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/main.dart';

class Questionario1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 231, 194), //fundo
      body: Padding(
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
                      flex: 1,
                      child:
                          Image(image: AssetImage('assets/imagens/gota1.png')),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'O que você está plantando?',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'quest2');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 251, 255, 240),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage('assets/imagens/alface.png'),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Alface",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'quest2');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 251, 255, 240),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage('assets/imagens/tomate.png'),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Tomate",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'quest2');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 251, 255, 240),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage('assets/imagens/rucula.png'),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Rucúla",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'quest2');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 251, 255, 240),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage('assets/imagens/morango.png'),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Morango",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // teste
            ],
          ),
        ),
      ),
    );
  }
}
