import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(SamaqApp());

class SamaqApp extends StatefulWidget {
  @override
  _SamaqAppState createState() => _SamaqAppState();
}

class _SamaqAppState extends State<SamaqApp> {
  bool isDarkMode = true;

  void toggleTheme() => setState(() => isDarkMode = !isDarkMode);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAMAQ',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(onThemeChanged: toggleTheme, isDarkMode: isDarkMode),
    );
  }
}
