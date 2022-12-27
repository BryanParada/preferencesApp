import 'package:flutter/material.dart';
import 'package:preferences_app/main.dart';
import 'package:preferences_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {

  static const String routerName = 'Settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isDarkMode = false;
  int gender = 1;
  String name = 'Pedro';

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
              value: isDarkMode,
              title: const Text('Dark mode'),
               onChanged: ( value ){
                  isDarkMode = value;
                  setState(() {});
               }
             ),
             const Divider(),

             RadioListTile<int>(
                value: 1,
                groupValue: gender,
                title: Text('Male'),
                onChanged: (value){
                  gender = value ?? 1;
                  setState(() {});
                }
              ),
              RadioListTile<int>(
                value: 2,
                groupValue: gender,
                title: Text('Female'),
                onChanged: (value){
                  gender = value ?? 2;
                  setState(() {});
                }
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: 'Bryan',
                  onChanged: (value){
                    name = value;
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