import 'package:flutter/material.dart';

import '../helper/resolution_size.dart';
import '../material/color_material.dart';
import '../material/text_style_material.dart';

class ReloadApk extends StatelessWidget {
  final String? codeError;
  final String? message;
  ReloadApk({super.key, this.codeError, this.message});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          height: 300,
          padding: EdgeInsets.all(30),
          color: colorWhite,
          child: Column(
            children: [
              Icon(
                Icons.wifi_off_rounded,
                color: colorRed,
                size: 30,
              ),
              resolutionSize.mediumResolutionSpaceHeight,
              Text(
                "Mohon maaf anda sedang tidak terhubung dengan internet",
                style: materialTextStyle.normalTextStyle,
                textAlign: TextAlign.center,
              ),
              Divider(),
              Expanded(child: resolutionSize.largeResolutionSpaceHeight),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.cloud_off_rounded,
                    color: colorGray,
                  ),
                  resolutionSize.largeResolutionSpaceWidth,
                  Expanded(
                    child: SizedBox(child: Divider()),
                  ),
                  RotatedBox(
                      quarterTurns: -2,
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: colorGray,
                        size: 15,
                      )),
                  resolutionSize.largeResolutionSpaceWidth,
                  Icon(
                    Icons.phone_iphone_rounded,
                    color: colorGray,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
