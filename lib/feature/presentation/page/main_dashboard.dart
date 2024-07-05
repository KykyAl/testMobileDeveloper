import 'package:caliana_cloning/feature/presentation/page/main_register.dart';
import 'package:caliana_cloning/feature/presentation/widget/dashboard_body.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/resolution_size.dart';
import '../../../core/material/color_material.dart';
import '../../../core/material/image_material.dart';
import '../../../core/material/text_style_material.dart';
import '../widget/formulir_body.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard>
    with SingleTickerProviderStateMixin {
  final DashboardBody body = DashboardBody();
  final DashboardHeader appbar = DashboardHeader();
  bool isInit = false;
  bool _isExpanded = false;
  int _selectedIndex = 0;

  late AnimationController _animationController;
  late Animation<double> _buttonAnimation;
  late Animation<double> _translateButton;
  static List<Widget> _widgetOptions = <Widget>[
    AnotherScreen(),
    AnotherScreen(),
  ];

  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _buttonAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _translateButton = Tween<double>(begin: 100, end: -5).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.bounceInOut));
    isInit = true;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _selectedIndex == index ? Colors.blue : Colors.black,
      ),
      onPressed: () {
        _onItemTapped(index);
      },
    );
  }

  _toggle() {
    if (_isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildIcon(Icons.home, 0),
              _buildIcon(Icons.airplane_ticket, 1),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 195,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Transform(
              transform: Matrix4.translationValues(
                  0.0, _translateButton.value * 3, 0.0),
              child: FloatingActionButton(
                heroTag: 'task-btn',
                onPressed: () {
                  _toggle();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainRegister(),
                      ));
                },
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, _translateButton.value * 2, 0.0),
              child: FloatingActionButton(
                heroTag: 'note-btn',
                onPressed: () {
                  _toggle();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationForm(),
                      ));
                },
                child: const Icon(Icons.notes),
              ),
            ),
            FloatingActionButton(
              onPressed: _toggle,
              elevation: 5,
              child: AnimatedIcon(
                icon: AnimatedIcons.add_event,
                progress: _buttonAnimation,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }
}

class AnotherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DashboardHeader appbar = DashboardHeader();
    return Column(children: [
      appbar.appBar(),
    ]);
  }
}

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
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
