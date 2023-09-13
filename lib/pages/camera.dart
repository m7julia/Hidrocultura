import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  Widget infoObjeto(BuildContext context) {
    return AlertDialog(
      content: Scaffold(
        body: Card(
          elevation: 0,
          color: Colors.transparent,
          surfaceTintColor: Colors.white,
          child: Column(
            children: [
              Image.file(
                File(imagem!.path),
                fit: BoxFit.contain,
              ),
              _outputs != null
                  ? Text(
                      _outputs![0]["label"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    )
                  : const SizedBox(
                      width: 140,
                      height: 10,
                    )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }

  /*Column(
          children: [
            Image.file(
              File(imagem!.path),
              fit: BoxFit.contain,
            ),
            _outputs != null
                ? Text(
                    _outputs![0]["label"],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  )
                : const SizedBox(
                    width: 140,
                    height: 10,
                  )
          ],
        ),*/
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
      print("No any camera found");
    }
  }

  tirarFoto() async {
    final CameraController? cameraController = controller;

    if (cameraController != null && cameraController.value.isInitialized) {
      try {
        XFile file = await cameraController.takePicture();
        if (mounted) {
          setState(() {
            imagem = file;
            img = File(file.path);
          });
        }
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
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 770,
                width: 450,
                child: controller == null
                    ? const Center(child: Text("Loading Camera..."))
                    : !controller!.value.isInitialized
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CameraPreview(controller!)),
            SizedBox(
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
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(72, 255, 255, 255)),
                    shape: MaterialStateProperty.all<CircleBorder>(
                        const CircleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2)))),
                child: const Text(''),
              ),
            ),
            const SizedBox(
              height: 2,
            )
          ],
        ),
      ),
    );
  }
}
