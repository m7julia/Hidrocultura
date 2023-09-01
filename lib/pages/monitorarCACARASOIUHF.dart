import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';

class CARALHO extends StatefulWidget {
  const CARALHO({super.key});

  @override
  State<CARALHO> createState() => _CARALHOState();
}

class _CARALHOState extends State<CARALHO> {
  Widget infoObjeto(BuildContext context) {
    return new AlertDialog(
      content: Scaffold(
        body: Column(
          children: [
            Image.file(
              File(imagem!.path),
              fit: BoxFit.contain,
            ),
            _outputs != null
                ? Text(
                    _outputs![0]["label"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  List<CameraDescription>? cameras = []; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image
  CameraImage? _image;
  XFile? imagem;
  File? img;
  Size? size;

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.high,
          enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);

      try {
        await controller!.initialize();
      } on CameraException catch (e) {
        print(e.description);
      }

      if (mounted) {
        setState(() {});
      }
    } else {
      print("NO any camera found");
    }
  }

  tirarFoto() async {
    final CameraController? cameraController = controller;

    if (cameraController != null && cameraController.value.isInitialized) {
      try {
        XFile file = await cameraController.takePicture();
        if (mounted)
          setState(() {
            imagem = file;
            img = File(file.path);
          });
      } on CameraException catch (e) {
        print(e.description);
      }
    }
  }

  loadModel2() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void initState() {
    super.initState();
    loadModel2();
    loadCamera();
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  bool _loading = false;
  List<dynamic>? _outputs;

  classifyImage(imagem) async {
    var out = await Tflite.runModelOnImage(
        path: imagem.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _loading = false;
      _outputs = out;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 200,
                width: 200,
                child: controller == null
                    ? Center(child: Text("Loading Camera..."))
                    : !controller!.value.isInitialized
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CameraPreview(controller!)),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 70,
                width: 70,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      if (controller != null) {
                        await tirarFoto();
                        classifyImage(imagem);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                infoObjeto(context));
                      }
                    } catch (e) {
                      print(e); //show error
                    }
                  },
                  child: Text(''),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all<CircleBorder>(
                          CircleBorder(
                              side: BorderSide(
                                  color: const Color.fromARGB(255, 34, 33, 33),
                                  width: 2)))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
