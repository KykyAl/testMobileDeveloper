import 'package:caliana_cloning/feature/presentation/widget/photo_wajah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/resolution_size.dart';
import '../../../core/material/color_material.dart';
import '../../../core/material/material_decoration.dart';
import '../../../core/material/text_style_material.dart';
import '../controller/controller.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: colorWhite,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: colorPrimary,
          ),
        ),
        title: Text(
          'Registration Form',
          style: materialTextStyle.formTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              label: 'Nomer Kartu Identitas',
              hintText: 'Masukkan nomor kartu identitas',
              icon: Icons.credit_card_outlined,
              controller: controller.cardNumberController.value,
            ),
            resolutionSize.mediumResolutionSpaceHeight,
            _buildTextField(
              label: 'Nomer Kartu Akses',
              hintText: 'Masukkan nomor kartu akses',
              icon: Icons.credit_card_outlined,
              controller: controller.accessCardController.value,
            ),
            SizedBox(height: 12),
            _buildTextField(
              label: 'Nama',
              hintText: 'Masukkan nama',
              icon: Icons.person_outline,
              controller: controller.nameController.value,
            ),
            SizedBox(height: 12),
            _buildTextField(
              label: 'Email',
              hintText: 'Masukkan email',
              icon: Icons.email_outlined,
              controller: controller.emailController.value,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhotoWajah()),
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
                'Selanjutnya',
                style: materialTextStyle.formTitleTextStyle.copyWith(
                    color: Colors.blue), // Style teks juga bisa disesuaikan
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text(
                'Batal',
              ),
              style: materialDecoration.buttonStylePrimary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: materialTextStyle.formTitleTextStyle,
        ),
        resolutionSize.mediumResolutionSpaceHeight,
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            style: materialTextStyle.normalTextStyleBold,
            decoration: materialDecoration.inputDecoration(
              icons: icon,
              labelWidth: 200,
              hintText: hintText,
              label: label,
            ),
          ),
        ),
      ],
    );
  }
}
