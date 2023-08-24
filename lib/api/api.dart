import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdi_eyes/camera_view/model.dart';

class ApiData extends GetxController {
  final apiUrl = 'http://192.168.1.15:8083/process_image';
  final bytesFile = <int>[].obs;
  late File filePath;

  getApiData(file) async {
    // Create a JSON payload
    final jsonData = {'image_data': file};
    final encodedData = jsonEncode(jsonData);
    // Encode the JSON payload to Base64

    // Create headers for the POST request
    final headers = {'Content-Type': 'application/json'};

    // Send the POST request
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: encodedData,
    );
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final processedImageResponse = ProcessedImageResponse.fromJson(jsonData);

      bytesFile.value =
          base64Decode(processedImageResponse.processedImage.data);
      print(bytesFile);
      // Get.toNamed('/camera_decode');
      // Handle the image data as needed

      // Get the directory for saving the file
      final appDir = await getApplicationDocumentsDirectory();
      final random = Random().nextInt(100);
      final file = File('${appDir.path}/$random.jpg');

      // Write the bytes to the file
      filePath = await file.writeAsBytes(bytesFile);
      print('Image saved as ${file.path}');
      Get.toNamed('/camera_decode');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
