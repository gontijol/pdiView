import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_eyes/camera_view/binding.dart';
import 'package:pdi_eyes/camera_view/page.dart';
import 'package:pdi_eyes/routes/routes.dart';

import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    home: const CameraView(),
    getPages: AppRoutes.pages,
    initialBinding: CameraBinding(),
  ));
}
