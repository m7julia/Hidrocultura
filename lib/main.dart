import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hidrocultura/pages/monitorarCACARASOIUHF.dart';
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
      home: CARALHO(),
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
      },
    );
  }
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late File _image;
//   List<TFLiteResult> _outputs = [];

//   @override
//   void initState() {
//     super.initState();
//     TFLiteHelper.loadModel();
//   }

//   @override
//   void dispose() {
//     TFLiteHelper.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Teachable Machine'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.photo_camera),
//         onPressed: _pickImage,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             _buildResult(),
//             _buildImage(),
//           ],
//         ),
//       ),
//     );
//   }

//   _buildImage() {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 92.0),
//         child: Container(
//           padding: EdgeInsets.all(8.0),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.white,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Center(
//             child: _image == null
//                 ? Text('Sem imagem')
//                 : Image.file(
//                     _image,
//                     fit: BoxFit.cover,
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

//   _pickImage() async {
//     final image = await CameraHelper.pickImage();
//     if (image == null) {
//       return null;
//     }

//     final outputs = await TFLiteHelper.classifyImage(image);

//     setState(() {
//       _image = image;
//       _outputs = outputs;
//     });
//   }

//   _buildResult() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
//       child: Container(
//         height: 150.0,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.white,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: _buildResultList(),
//       ),
//     );
//   }

//   _buildResultList() {
//     if (_outputs.isEmpty) {
//       return Center(
//         child: Text('Sem resultados'),
//       );
//     }

//     return Center(
//       child: ListView.builder(
//         itemCount: _outputs.length,
//         shrinkWrap: true,
//         padding: const EdgeInsets.all(20.0),
//         itemBuilder: (BuildContext context, int index) {
//           return Column(
//             children: <Widget>[
//               Text(
//                 '${_outputs[index].label} ( ${(_outputs[index].confidence! * 100.0).toStringAsFixed(2)} % )',
//                 style: TextStyle(fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               LinearPercentIndicator(
//                 lineHeight: 14.0,
//                 percent: _outputs[index].confidence,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
