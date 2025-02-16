import 'package:ai_object_detector/controller/scan_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          return controller.isCameraInitialized.value
          ? Stack(
            children: [
              CameraPreview(controller.cameraController),
              Positioned(
                top: controller.y * context.height * 0.65,
                right: (1-controller.x - controller.w) * context.width,
                child: Container(
                  width: controller.w * context.width,
                  height: controller.h * context.height * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green, width: 4.0)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Text(controller.label),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ) 
          : const Center(child: Text("Loading Preview..."),);
        }),
    );
  }
}