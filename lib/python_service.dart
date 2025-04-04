import 'package:flutter/services.dart';

class PythonService {
  static const platform = MethodChannel('com.example.myapp/python');

  Future<String> processImage(String path) async {
    final result = await platform.invokeMethod('processImage', {'path': path});
    return result;
  }
}
