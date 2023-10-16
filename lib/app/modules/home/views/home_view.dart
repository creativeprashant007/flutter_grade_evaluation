import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (!controller.cameraController!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(title: Text('Emotion Detection App')),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: 300,
            child: CameraPreview(controller.cameraController!),
          ),
          SizedBox(height: 20),
          controller.isModelLoaded
              ? Text(
                  'Emotion: Emotion Prediction Here') // Display the predicted emotion
              : Text('Loading Model...'),
        ],
      ),
    );
  }
}
