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
      appBar: AppBar(title: const Text('Emotion Detection App')),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 300,
            width: 300,
            child: CameraPreview(controller.cameraController!),
          ),
          const SizedBox(height: 20),
          controller.isModelLoaded
              ? const Text(
                  'Emotion: Emotion Prediction Here') // Display the predicted emotion
              : const Text('Loading Model...'),
        ],
      ),
    );
  }
}
