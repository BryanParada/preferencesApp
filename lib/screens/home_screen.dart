import 'package:flutter/material.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routerName = 'Home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text('is Dark mode: ${Preferences.isDarkMode }'),
          Divider(),
          Text('Gender: ${Preferences.gender}'),
          Divider(),
          Text('Username: ${Preferences.name}'),
          Divider(),
          
        ],
      ),
    );
  }
}