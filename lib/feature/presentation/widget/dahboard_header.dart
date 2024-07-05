import 'package:caliana_cloning/core/helper/resolution_size.dart';
import 'package:caliana_cloning/core/material/color_material.dart';
import 'package:caliana_cloning/core/material/image_material.dart';
import 'package:caliana_cloning/core/material/text_style_material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardHeader {
  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: AppBar(
        backgroundColor: colorGray,
        elevation: 0.0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      imageMaterial.logo,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 8),
                      Stack(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: colorWhite,
                                ),
                                child: Text(
                                  "recruitment",
                                  style: materialTextStyle.normalTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(imageMaterial.person),
                              ),
                              resolutionSize.mediumResolutionSpaceWidth,
                              IconButton(
                                icon: Icon(
                                  Icons.notifications_sharp,
                                  size: 30,
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(Get.context!)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text('First button pressed'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              StreamBuilder(
                stream: Stream.periodic(Duration(seconds: 1)),
                builder: (context, snapshot) {
                  var now = DateTime.now();
                  var formattedTime = DateFormat('h:mm:ss a').format(now);
                  var formattedDate =
                      DateFormat('EEEE, dd MMMM yyyy', 'id').format(now);

                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formattedDate,
                            style: materialTextStyle.normalTextStyleBold),
                        Text(formattedTime,
                            style: materialTextStyle.normalTextStyleBold),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
