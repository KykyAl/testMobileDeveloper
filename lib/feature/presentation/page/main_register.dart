import 'package:caliana_cloning/core/material/color_material.dart';
import 'package:caliana_cloning/feature/presentation/widget/register_body.dart';
import 'package:caliana_cloning/feature/presentation/widget/register_header.dart';
import 'package:flutter/material.dart';

class MainRegister extends StatefulWidget {
  const MainRegister({super.key});

  @override
  State<MainRegister> createState() => _MainRegisterState();
}

class _MainRegisterState extends State<MainRegister> {
  final RegisterHeader appBar = RegisterHeader();
  final RegisterBody body = RegisterBody();

  @override
  void initState() {
    super.initState();
  }

  initialcamera() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorWhite,
        body: Column(
          children: [appBar.appBar(context), body.body(context)],
        ));
  }
}
