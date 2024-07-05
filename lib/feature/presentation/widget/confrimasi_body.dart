import 'package:caliana_cloning/core/helper/resolution_size.dart';
import 'package:caliana_cloning/core/material/color_material.dart';
import 'package:caliana_cloning/core/material/text_style_material.dart';
import 'package:caliana_cloning/feature/presentation/page/main_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class ConfirmDataForm extends StatelessWidget {
  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konfirmasi Data',
          style: materialTextStyle.formTitleTextStyle,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Kartu Identitas',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              controller.cardNumberController.value.text,
              style: materialTextStyle.normalTextStyle,
            ),
            SizedBox(height: 8),
            Text(
              'Nomer Kartu Identitas',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(controller.cardNumberController.value.text,
                style: materialTextStyle.normalTextStyle),
            SizedBox(height: 24),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: colorPrimary),
            ),
            SizedBox(height: 24),
            Text(
              'Foto Wajah',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: colorPrimary),
            ),
            SizedBox(height: 8),
            Text(
              'Data Pribadi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nama',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(controller.nameController.value.text),
                SizedBox(height: 16),
                Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(controller.emailController.value.text),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainDashboard(),
                  ),
                );
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.blue, width: 2)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(
                'Konfirmasi',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            resolutionSize.costumizeResolution(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(
                    color: Color.fromARGB(255, 216, 216, 216), width: 2)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(
                'Batal',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
