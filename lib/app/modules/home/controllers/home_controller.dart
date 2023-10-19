import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  CameraController? cameraController;
  List<CameraDescription>? cameras;
  bool isModelLoaded = false;
  @override
  void onInit() {
    loadModel();
    setupCamera();
    super.onInit();
  }



  void loadModel() async {
    await Tflite.loadModel(
      model: "assets/emotion_model.tflite",
      labels: "assets/emotion_labels.txt",
    );
    isModelLoaded = true;
    update();
  }

  void setupCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    await cameraController?.initialize();
    update();
    return;
  }
}
