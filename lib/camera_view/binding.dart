import 'package:get/get.dart';
import 'package:pdi_eyes/camera_view/controller.dart';

class CameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraPreviewController>(() => CameraPreviewController());
  }
}
