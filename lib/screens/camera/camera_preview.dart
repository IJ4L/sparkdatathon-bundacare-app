import 'package:bundacare/screens/widgets/appbar_widget.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CameraPreviewPage extends StatefulWidget {
  const CameraPreviewPage({super.key});

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewState();
}

class _CameraPreviewState extends State<CameraPreviewPage> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    controller.lockCaptureOrientation(DeviceOrientation.landscapeRight);
    _initializeControllerFuture = controller.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(context, 'Camera', () {
        context.goNamed(RouterPath.home);
      }),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CameraPreview(
              controller,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 40),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  style: IconButton.styleFrom(
                    padding: const EdgeInsets.all(18),
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    // try {
                    //   await _initializeControllerFuture;
                    //   // final image = await controller.takePicture();
                    //   // context.goNamed(RouterPath.cameraResult, arguments: image.path);
                    // } catch (e) {
                      
                    // }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
