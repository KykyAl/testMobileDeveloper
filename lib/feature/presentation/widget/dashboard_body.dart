import 'package:caliana_cloning/core/helper/resolution_size.dart';
import 'package:caliana_cloning/core/material/text_style_material.dart';
import 'package:caliana_cloning/feature/presentation/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/material/color_material.dart';

class DashboardBody {
  final controller = Get.find<DashboardController>();
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari...',
                              border: InputBorder.none,
                              icon: Icon(Icons.search),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          resolutionSize.costumizeResolution(height: 40),
          Container(
            height: 250,
            margin: EdgeInsets.only(right: 5, left: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: colorWhite),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Fitur',
                    style: materialTextStyle.formTitleTextStyle,
                  ),
                ),
                TabBar(
                  indicatorWeight: 1,
                  onTap: (value) => controller.curentTabs.value = value,
                  unselectedLabelColor: colorWhite,
                  labelColor: colorWhite,
                  padding: EdgeInsets.all(0),
                  labelPadding: EdgeInsets.all(0),
                  indicatorPadding: EdgeInsets.all(0),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: _buildTab(text: 'Semua Fitur', tabIndex: 0),
                    ),
                    Tab(
                      child: _buildTab(
                        text: 'Visitor Management System',
                        tabIndex: 1,
                      ),
                    ),
                    Tab(
                      child:
                          _buildTab(text: 'Access Control System', tabIndex: 2),
                    ),
                  ],
                  labelStyle: TextStyle(
                      color: colorPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                  indicator: UnderlineTabIndicator(),
                  controller: controller.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: colorPrimaryDark,
                ),
                Expanded(
                  child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        visitall(),
                        VisitorManagementSystem(context),
                        AccessToolsSystem(),
                      ]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hari ini',
              style: materialTextStyle.formTitleTextStyle,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tidak ada pengunjung ',
                  textAlign: TextAlign.center,
                  style: materialTextStyle.formTitleTextStyle,
                ),
                Text('Daftar pengunjung akan di tampilkan di sini.',
                    style: materialTextStyle.normalTextStyle,
                    textAlign: TextAlign.center),
                resolutionSize.costumizeResolution(height: 20),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorBlue),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Refresh',
                    style: materialTextStyle.formTitleTextStyle,
                  )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTab({required String text, required int tabIndex}) {
    Size screen =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
    double tabWidth = screen.width / 2;
    return Obx(() => Container(
        height: 100,
        width: tabWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: controller.curentTabs.value == tabIndex
              ? colorPrimary
              : colorWhite,
        ),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(color: colorAccent),
              textAlign: TextAlign.center,
            ))));
  }

  Widget visitall() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              resolutionSize.largeResolutionSpaceHeight,
              Icon(Icons.add_chart_sharp, size: 50),
              Text('Dashboard', style: materialTextStyle.normalTextStyleGrey),
            ],
          ),
          Column(
            children: [
              resolutionSize.largeResolutionSpaceHeight,
              Icon(Icons.contact_mail_rounded, size: 50),
              Text(
                'Daftar\nPengunjung',
                style: materialTextStyle.normalTextStyleGrey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              resolutionSize.largeResolutionSpaceHeight,
              Icon(Icons.home_work, size: 50),
              Text('Residen', style: materialTextStyle.normalTextStyleGrey),
            ],
          ),
        ],
      ),
    );
  }

  Widget VisitorManagementSystem(context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Tidak sempat di clone'),
                ),
              );
            },
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('This is a snackbar!'),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating, // Make snackbar float
                    margin: EdgeInsets.all(30), // Optional: Adjust margin
                  ),
                );
              },
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tidak sempat di clone'),
                    ),
                  );
                },
                child: Column(
                  children: [
                    resolutionSize.largeResolutionSpaceHeight,
                    Icon(Icons.add_chart_sharp, size: 50),
                    Text('Dashboard',
                        style: materialTextStyle.normalTextStyleGrey),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              resolutionSize.largeResolutionSpaceHeight,
              Icon(Icons.contact_mail_rounded, size: 50),
              Text(
                'Daftar \nPengunjung',
                style: materialTextStyle.normalTextStyleGrey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              resolutionSize.largeResolutionSpaceHeight,
              Icon(Icons.home_work, size: 50),
              Text('Residen', style: materialTextStyle.normalTextStyleGrey),
            ],
          ),
        ],
      ),
    );
  }

  Widget AccessToolsSystem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        resolutionSize.largeResolutionSpaceHeight,
        Icon(Icons.add_chart_sharp, size: 50),
        Text('Dashboard', style: materialTextStyle.normalTextStyleGrey),
      ],
    );
  }
}
