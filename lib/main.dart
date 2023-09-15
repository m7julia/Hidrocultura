import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/pages/camera.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/germinando.dart';
import 'package:flutter_hidrocultura/pages/inicial.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/ja_germinou_primeira_part.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/prim_passos.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/quest1.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/quest2.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/ja_germinei.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/problemasistema.dart';
import 'package:flutter_hidrocultura/pages/monitorar/temperatura.dart';
import 'package:flutter_hidrocultura/pages/monitorar/luminosidade.dart';
import 'package:flutter_hidrocultura/pages/monitorar/umidade.dart';
import 'package:flutter_hidrocultura/pages/monitorar/ph.dart';
import 'package:flutter_hidrocultura/pages/monitorar/co2.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "HidroCultura",
      debugShowCheckedModeBanner: false,
      home: const Questionario1(),
      routes: {
        //Tutoriais
        'quest1': (context) => const Questionario1(),
        'quest2': (context) => const Questionario2(),
        'primPassos': (context) => const PrimeirosPassos(),
        'jaGerminei': (context) => const JaGerminei(),
        'germinando': (context) => const Germinando(),
        'jaGerminouPP': (context) => const JaGerminouPP(),
        'problemasistema': (context) => const ProblemaSistema(),

        'inicial': (context) => Inicial(
              estadoPlanta: "",
            ),

        //monitorar
        'temperatura': (context) => const Temperatura(),
        'luminosidade': (context) => Luminosidade(
              estadoPlanta: "",
            ),
        'umidade': (context) => const Umidade(),
        'ph': (context) => const Ph(),
        'co2': (context) => Co2(
              estadoPlanta: "",
            ),
        'camera': (context) => const Camera()
      },
    );
  }
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   
//   
// }
