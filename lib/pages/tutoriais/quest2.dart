import 'package:flutter/material.dart';

class Questionario2 extends StatelessWidget {
  const Questionario2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 231, 194), //fundo
      body: Padding(
        padding: const EdgeInsets.all(50.0),
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
                      flex: 1,
                      child:
                          Image(image: AssetImage('assets/imagens/gota1.png')),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Em que etapa estou?',
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
                width: 350,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'primPassos');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 251, 255, 240),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image:
                              AssetImage('assets/imagens/primeirospassos.png'),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Primeiros Passos",
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
                width: 350,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'jaGerminei');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 251, 255, 240),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage('assets/imagens/germinei.png'),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Já Germinei!",
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
                width: 350,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'inicial');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 251, 255, 240),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage('assets/imagens/japlantei.png'),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Já Plantei!",
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
                width: 120,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'quest1');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 180, 220, 156),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Anterior', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
