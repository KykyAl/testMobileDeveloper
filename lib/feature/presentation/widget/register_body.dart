import 'package:caliana_cloning/core/helper/resolution_size.dart';
import 'package:flutter/material.dart';

import 'photo_body_e-ktp.dart';

class RegisterBody {
  Widget body(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildContainer(
                context,
                Icons.home,
                'Home',
                CardPhoto(
                  title: 'Pindai e-KTP',
                  deskripsi: 'Tampilkan e-KTP di dalam kontak',
                )),
            _buildContainer(
                context,
                Icons.person,
                'SIM',
                CardPhoto(
                  title: 'Pindai SIM',
                  deskripsi: 'Tampilkan SIM di dalam kontak',
                )),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildContainer(
                context,
                Icons.settings,
                'Pasopor',
                CardPhoto(
                  title: 'Pindai Paspor',
                  deskripsi: 'Tampilkan Paspor di dalam kontak',
                )),
            _buildContainer(context, Icons.info, 'Lainnya', InfoScreen()),
          ],
        ),
      ],
    );
  }

  Widget _buildContainer(
      BuildContext context, IconData icon, String text, Widget targetScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Container(
        height: 101,
        width: 150,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            resolutionSize.mediumResolutionSpaceWidth,
            Text(text, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('This is the Profile Screen')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('This is the Settings Screen')),
    );
  }
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info')),
      body: Center(child: Text('This is the Info Screen')),
    );
  }
}
