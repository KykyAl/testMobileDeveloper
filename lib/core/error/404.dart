import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/navigator_helper.dart';
import '../helper/resolution_size.dart';
import '../material/color_material.dart';
import '../material/material_decoration.dart';
import '../material/text_style_material.dart';

class NotFound extends StatelessWidget {
  final String? codeError;
  final String? message;
  NotFound({super.key, this.codeError, this.message});
  final NavigatorHelper _navigatorHelper = NavigatorHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              codeError!,
              style: materialTextStyle.largeTextStyleBlack30,
            ),
            Divider(
              endIndent: 50,
              indent: 50,
              thickness: 2,
              color: colorBlack,
            ),
            resolutionSize.largeResolutionSpaceHeight,
            Column(
              children: [
                Icon(
                  Icons.error_sharp,
                  size: 30,
                  color: colorRed,
                ),
                resolutionSize.mediumResolutionSpaceHeight,
                Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: materialTextStyle.normalTextStyle,
                ),
                resolutionSize.costumizeResolution(height: 100),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: materialDecoration.buttonStylePrimary,
                      onPressed: () => Get.offAndToNamed(_navigatorHelper.root),
                      child: Text('Mulai ulang Aplikasi')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
