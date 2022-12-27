import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  static const String routerName = 'Settings';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings')
      ),
      body: Center(
        child: Text('SettingsScreen')
        ),
    );
  }
}