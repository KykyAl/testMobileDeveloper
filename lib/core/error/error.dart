import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HendlingError {
  void exitCode1() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      if (kReleaseMode) exit(1);
    };
  }

  Widget materialBuilderError(context, widget) {
    Widget error = const Text('...rendering error...');
    if (widget is Scaffold || widget is Navigator) {
      error = Scaffold(body: Center(child: error));
    }
    ErrorWidget.builder = (errorDetails) => error;
    if (widget != null) return widget;
    throw ('widget is null');
  }
}

class CheckMockedLocation {}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
