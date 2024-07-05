import 'package:caliana_cloning/core/helper/navigator_helper.dart';
import 'package:caliana_cloning/core/material/color_material.dart';
import 'package:caliana_cloning/core/material/text_style_material.dart';
import 'package:caliana_cloning/feature/presentation/controller/controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/resolution_size.dart';
import '../../../main.dart';
import 'confrimasi_body.dart';

class PhotoWajah extends StatefulWidget {
  @override
  State<PhotoWajah> createState() => _PhotoWajahState();
}

class _PhotoWajahState extends State<PhotoWajah> {
  final NavigatorHelper navigatorHelper = NavigatorHelper();
  final controller = Get.find<DashboardController>();
  late CameraController cameraController;

  // PhotoWajah() {
  @override
  void initState() {
    openCamera();
    super.initState();
  }

  openCamera() async {
    // final pickedFile =
    //     await ImagePicker().pickImage(source: ImageSource.camera);
    // if (pickedFile != null) {
    //   imageFile.value = File(pickedFile.path);
    // }

    if (cameras.isNotEmpty) {
      cameraController = CameraController(cameras[0], ResolutionPreset.max);
      cameraController.initialize()
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
          'Ambil Foto Wajah',
          style: materialTextStyle.formTitleTextStyle,
        ),
        backgroundColor: colorWhite,
      ),
      body: Column(children: [
        resolutionSize.costumizeResolution(height: 50),
        Text(
          'Tolong Posisikan Wajah Anda di tengah area selfie dan lalu ambil foto',
          style: materialTextStyle.normalTextStyle,
          textAlign: TextAlign.center,
        ),
        resolutionSize.costumizeResolution(height: 20),
        _initialCamera(),
        resolutionSize.costumizeResolution(height: 20),
        Text(
          'Ambil Gambar',
          style: materialTextStyle.formTitleTextStyle,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmDataForm(),
              ),
            );
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

  _initialCamera() {
    if (!cameraController.value.isInitialized) {
      return SizedBox();
    } else {
      return Container(
          height: 300,
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CameraPreview(cameraController),
          ));
    }
  }
}
