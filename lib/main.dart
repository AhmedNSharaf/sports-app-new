import 'package:flutter/material.dart';
import 'package:sports_app/screens/sports_category.dart';
import 'package:sports_app/widgets/splash/splashScreenWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}