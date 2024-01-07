import 'package:currency_converter/screens/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'J & J Currency Hub',
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

