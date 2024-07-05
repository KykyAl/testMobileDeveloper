import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:caliana_cloning/feature/presentation/page/main_dashboard.dart';
import 'package:caliana_cloning/feature/presentation/page/main_register.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'core/error/error.dart';
import 'core/helper/navigator_helper.dart';
import 'core/material/color_material.dart';
import 'core/material/image_material.dart';
import 'feature/presentation/controller/controller.dart';
import 'feature/presentation/widget/formulir_body.dart';

final navigatorKey = GlobalKey<NavigatorState>();
late List<CameraDescription> cameras;
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return InitialApp();
  }
}

class Dependency implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
  }
}

class InitialApp extends StatelessWidget {
  InitialApp({super.key});
  final NavigatorHelper navigatorHelper = NavigatorHelper();
  final HendlingError hendlingError = HendlingError();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Dependency(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
        child: child!,
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
          devicePixelRatio: MediaQuery.of(context).devicePixelRatio,
        ),
      ),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      theme: ThemeData(
          scaffoldBackgroundColor: colorWhite,
          bottomAppBarTheme: BottomAppBarTheme(
              elevation: 0.0,
              padding: EdgeInsets.only(
                top: 10,
              ))),
      navigatorKey: navigatorKey,
      getPages: [
        GetPage(name: navigatorHelper.dashboard, page: () => MainDashboard()),
        GetPage(
          name: navigatorHelper.registrasi,
          page: () => MainRegister(),
        ),
        GetPage(
          name: navigatorHelper.registrationForm,
          page: () => RegistrationForm(),
        )
      ],
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        nextScreen: MainDashboard(),
        splash: imageMaterial.logo_1,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 200,
      ),
    );
  }
}
