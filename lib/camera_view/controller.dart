import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:pdi_eyes/api/api.dart';

class CameraPreviewController extends GetxController {
  late CameraController? cameraController;
  RxBool isCameraInitialized = false.obs;
  final localFile = ''.obs;
  final bytesFile = <int>[].obs;
  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => ApiData());
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();
      cameraController =
          CameraController(cameras[1], ResolutionPreset.ultraHigh);
      await cameraController!.initialize();
      isCameraInitialized.value = true;
      update();
    } catch (e) {
      print("Camera initialization error: $e");
    }
  }

  takePhotoAndUpload() async {
    if (!isCameraInitialized.isTrue) {
      return;
    }

    try {
      if (cameraController!.value.isInitialized) {
        final XFile file = await cameraController!.takePicture();

        // Obtenha uma referência ao Firebase Storage
        final storageRef =
            FirebaseStorage.instance.ref().child('pdi_photos/${file.name}');

        // Carregue o arquivo para o Firebase Storage
        final task = await storageRef.putFile(File(file.path));

        // Obtenha a URL do arquivo no Firebase Storage
        final downloadUrl = await task.ref.getDownloadURL();
        // Agora você pode usar a URL para exibir a imagem, compartilhá-la, etc.
        print('Uploaded photo URL: $downloadUrl');

        Get.find<ApiData>().getApiData(downloadUrl);
      }
    } catch (e) {
      print("Error taking photo or uploading: $e");
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
