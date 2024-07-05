import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/material/color_material.dart';
import '../../../core/material/text_style_material.dart';

class RegisterHeader {
  Widget appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: colorWhite,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: colorPrimary,
              )),
          title: Column(
            children: [
              Text(
                'Pilih Kartu Identitas',
                style: materialTextStyle.formTitleTextStyle,
              ),
            ],
          ),
        ));
  }
}
