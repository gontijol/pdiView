import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_eyes/camera_view/controller.dart';

class CameraView extends GetView<CameraPreviewController> {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CameraPreviewController>(
        init: CameraPreviewController(),
        builder: (controller) {
          if (controller.isCameraInitialized.isTrue) {
            if (controller.cameraController != null &&
                controller.cameraController!.value.isInitialized) {
              return Stack(
                children: [
                  CameraPreview(controller.cameraController!),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Tirar a foto quando o botão for pressionado
                          XFile? photoFile =
                              await controller.takePhotoAndUpload();
                          if (photoFile != null) {
                            // Aqui você pode fazer algo com a foto, como exibi-la em uma nova tela
                          }
                        },
                        child: const Text('Tirar Foto'),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Erro ao inicializar a câmera.'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
