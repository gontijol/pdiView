class ProcessedImage {
  final ProcessedImageData data;

  ProcessedImage({required this.data});

  factory ProcessedImage.fromJson(Map<String, dynamic> json) {
    return ProcessedImage(
      data: ProcessedImageData.fromJson(json['data']),
    );
  }
}

class ProcessedImageResponse {
  final ProcessedImageData processedImage;

  ProcessedImageResponse({required this.processedImage});

  factory ProcessedImageResponse.fromJson(Map<String, dynamic> json) {
    return ProcessedImageResponse(
      processedImage: ProcessedImageData.fromJson(json['processed_image']),
    );
  }
}

class ProcessedImageData {
  final String format;
  final int width;
  final int height;
  final String data;

  ProcessedImageData({
    required this.format,
    required this.width,
    required this.height,
    required this.data,
  });

  factory ProcessedImageData.fromJson(Map<String, dynamic> json) {
    return ProcessedImageData(
      format: json['format'],
      width: json['width'],
      height: json['height'],
      data: json['data'],
    );
  }
}
