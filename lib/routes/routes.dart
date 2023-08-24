import 'package:get/get.dart';
import 'package:pdi_eyes/camera_view/binding.dart';
import 'package:pdi_eyes/camera_view/page.dart';
import 'package:pdi_eyes/decoded_image/page.dart';

class AppRoutes {
  static const String cameraView = '/';
  static const String cameraDecode = '/camera_decode';

  static final pages = [
    GetPage(
      name: cameraView,
      page: () => const CameraView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: cameraDecode,
      page: () => const ProcessedImageScreen(),
    ),
  ];
}
