import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SamaqApp());
}

class SamaqApp extends StatefulWidget {
  const SamaqApp({super.key});

  @override
  State<SamaqApp> createState() => _SamaqAppState();
}

class _SamaqAppState extends State<SamaqApp> {
  bool isDarkMode = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAMAQ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: isDarkMode ? const Color(0xFF0F0F0F) : Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blueAccent),
      ),
      home: HomeScreen(onThemeChanged: toggleTheme, isDarkMode: isDarkMode),
    );
  }
}
