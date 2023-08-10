import 'package:flutter/material.dart';

class quest2 extends StatelessWidget {
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
              Text('Em que etapa estou?', style: TextStyle(fontSize: 20)),
              SizedBox(
                width: 350,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    print('pressionado');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 251, 255, 240),
                    onPrimary: Colors.black,
                  ),
                  child:
                      Text('Primeiros Passos', style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(
                width: 350,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    print('pressionado');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 251, 255, 240),
                    onPrimary: Colors.black,
                  ),
                  child: Text('já Germinei!', style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(
                width: 350,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    print('pressionado');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 251, 255, 240),
                    onPrimary: Colors.black,
                  ),
                  child: Text('Já Plantei!', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
