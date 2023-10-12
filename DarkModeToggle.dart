/*
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.2
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DarkModeToggle(),
    );
  }
}

class DarkModeToggle extends StatefulWidget {
  @override
  _DarkModeToggleState createState() => _DarkModeToggleState();
}

class _DarkModeToggleState extends State<DarkModeToggle> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dark Mode'),
          centerTitle: true,
          elevation: 0.0,


        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Switch between Light and Dark Mode:',
                style: TextStyle(fontSize: 18),
              ),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  toggleTheme();
                },
              ),
              Text(
                'This is your content!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
