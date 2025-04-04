package com.example.footwork_tracker

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.chaquo.python.Python

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.myapp/python"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "processImage") {
                val path = call.argument<String>("path")
                val py = Python.getInstance()
                val module = py.getModule("image_processor")
                val output = module.callAttr("process_image", path)
                result.success(output.toString())
            } else {
                result.notImplemented()
            }
        }
    }
}
