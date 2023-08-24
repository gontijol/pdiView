import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdi_eyes/api/api.dart';

class ProcessedImageScreen extends GetView {
  const ProcessedImageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Processed Image'),
      ),
      body: Center(
        child: Image.file(Get.find<ApiData>().filePath),
      ),
    );
  }
}
