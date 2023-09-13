import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/pages/camera.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/germinando.dart';
import 'package:flutter_hidrocultura/pages/inicial.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/jaGerminouPP.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/primPassos.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/quest1.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/quest2.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/jaGerminei.dart';
import 'package:flutter_hidrocultura/pages/tutoriais/problemasistema.dart';
import 'package:flutter_hidrocultura/pages/monitorar/temperatura.dart';
import 'package:flutter_hidrocultura/pages/monitorar/luminosidade.dart';
import 'package:flutter_hidrocultura/pages/monitorar/umidade.dart';
import 'package:flutter_hidrocultura/pages/monitorar/ph.dart';
import 'package:flutter_hidrocultura/pages/monitorar/co2.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "HidroCultura",
      debugShowCheckedModeBanner: false,
      home: Inicial(),
      routes: {
        //Tutoriais
        'quest1': (context) => Questionario1(),
        'quest2': (context) => Questionario2(),
        'primPassos': (context) => PrimeirosPassos(),
        'jaGerminei': (context) => JaGerminei(),
        'germinando': (context) => Germinando(),
        'jaGerminouPP': (context) => JaGerminouPP(),
        'problemasistema': (context) => ProblemaSistema(),

        'inicial': (context) => Inicial(),

        //monitorar
        'temperatura': (context) => Temperatura(),
        'luminosidade': (context) => Luminosidade(),
        'umidade': (context) => Umidade(),
        'ph': (context) => Ph(),
        'co2': (context) => Co2(),
        'camera': (context) => Camera()
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
