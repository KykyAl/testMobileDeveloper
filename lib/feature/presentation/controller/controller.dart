import 'dart:developer';
import 'dart:io';

import 'package:caliana_cloning/core/helper/navigator_helper.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<int> curentTabs = 0.obs;
  late TabController tabController;
  late CameraController cameraController;
  Rx<File?> imageFile = Rx<File?>(null);
  Rx<TextEditingController> cardNumberController =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> accessCardController =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> nameController =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> emailController =
      TextEditingController(text: '').obs;
  final NavigatorHelper navigatorHelper = NavigatorHelper();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {});
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  submitPhoto() async {
    cameraController.takePicture().then((value) async {
      log('image path ${value.path}');
      cameraController.lockCaptureOrientation();
      await cameraController.pausePreview();
      if (value.path.isNotEmpty) {
        Get.toNamed(navigatorHelper.registrationForm);
      }
    });
  }
}
