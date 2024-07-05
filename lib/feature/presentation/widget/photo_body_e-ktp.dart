import 'dart:developer';

import 'package:caliana_cloning/core/helper/navigator_helper.dart';
import 'package:caliana_cloning/core/material/color_material.dart';
import 'package:caliana_cloning/core/material/text_style_material.dart';
import 'package:caliana_cloning/feature/presentation/controller/controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/resolution_size.dart';
import '../../../main.dart';

class CardPhoto extends StatefulWidget {
  final String? title;
  final String? deskripsi;
  CardPhoto({this.title, this.deskripsi});
  @override
  State<CardPhoto> createState() => _CardPhotoState();
}

class _CardPhotoState extends State<CardPhoto> {
  final NavigatorHelper navigatorHelper = NavigatorHelper();
  final controller = Get.find<DashboardController>();

  // HomeScreen() {
  @override
  void initState() {
    openCamera();
    super.initState();
  }

  openCamera() async {
    if (cameras.isNotEmpty) {
      controller.cameraController =
          CameraController(cameras[0], ResolutionPreset.max);
      controller.cameraController.addListener(() {
        log('camera ${cameras[0]}');
      });
      controller.cameraController.initialize()
        ..then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        }).catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                break;
              default:
                break;
            }
          }
        });
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: colorPrimary,
            )),
        title: Text(
          widget.title ?? '',
          style: materialTextStyle.formTitleTextStyle,
        ),
        backgroundColor: colorWhite,
      ),
      body: Column(children: [
        resolutionSize.costumizeResolution(height: 50),
        Text(
          widget.deskripsi ?? '',
          style: materialTextStyle.normalTextStyle,
        ),
        resolutionSize.costumizeResolution(height: 20),
        _initialCamera(),
        resolutionSize.costumizeResolution(height: 20),
        Text(
          'Ambil Gambar',
          style: materialTextStyle.formTitleTextStyle,
        ),
        IconButton(
          onPressed: () async {
            await controller.submitPhoto();
          },
          icon: Icon(
            Icons.camera_alt_outlined,
            color: colorPrimary,
            size: 50,
          ),
        ),
      ]),
    );
  }

  Future<void> onCaptureOrientationLockButtonPressed() async {
    try {
      final CameraController camController = controller.cameraController;
      if (camController.value.isCaptureOrientationLocked) {
        await camController.unlockCaptureOrientation();
      } else {
        await camController.lockCaptureOrientation();
      }
    } on CameraException catch (e) {}
  }

  _initialCamera() {
    if (!controller.cameraController.value.isInitialized) {
      return Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
      );
    } else {
      return Container(
          height: 300,
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CameraPreview(controller.cameraController),
          ));
    }
  }
}
