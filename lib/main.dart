import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:where_to/Screens/WelcomePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "WhereTo",
        home: const Scaffold(
          backgroundColor: Color(0xFFBFD6D9),
          body: WelcomePage(),
        ));
  }
}
