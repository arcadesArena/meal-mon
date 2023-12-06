import 'package:flutter/material.dart';
import 'package:meal_mon/ui/authn/landing_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purple[300],
        highlightColor: Colors.purple[100],
        focusColor: Colors.purple[700]
      ),
      debugShowCheckedModeBanner: true,
      home: LandingPage(),
    );
  }
}
