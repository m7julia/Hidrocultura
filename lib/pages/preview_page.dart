import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewPage extends StatelessWidget {
  File? file;

  PreviewPage({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            child: Stack(
          children: [
            Positioned.fill(
              child: Image.file(file!, fit: BoxFit.cover),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.black.withOpacity(0.6),
                      child: IconButton(
                        icon: Icon(Icons.check, color: Colors.white, size: 30),
                        onPressed: () => Get.back(result: file),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.black.withOpacity(0.6),
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.white, size: 30),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ))
      ],
    ));
  }
}
