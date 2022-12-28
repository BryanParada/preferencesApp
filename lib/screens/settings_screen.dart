import 'package:flutter/material.dart';
import 'package:preferences_app/main.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {

  static const String routerName = 'Settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'Pedro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings')
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Settings', style: TextStyle( fontSize: 35, fontWeight: FontWeight.w300)),
            const Divider(),

            SwitchListTile.adaptive(
              value: Preferences.isDarkMode,
              title: const Text('Dark mode'),
               onChanged: ( value ){
                  Preferences.isDarkMode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

                  value 
                  ? themeProvider.setDarkMode()
                  : themeProvider.setLightMode(); 

                  setState(() {});
               }
             ),
             const Divider(),

             RadioListTile<int>(
                value: 1,
                groupValue: Preferences.gender,
                title: Text('Male'),
                onChanged: (value){
                  Preferences.gender = value ?? 1;
                  setState(() {});
                }
              ),
              RadioListTile<int>(
                value: 2,
                groupValue: Preferences.gender,
                title: Text('Female'),
                onChanged: (value){
                  Preferences.gender = value ?? 2;
                  setState(() {});
                }
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value){
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    helperText: 'User Name'
                  ),
                )

              ),


          ]
        )
      ),
      
    );
  }
}