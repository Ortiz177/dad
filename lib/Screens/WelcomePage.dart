import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:where_to/Screens/MapPage.dart';
import 'package:where_to/Screens/UserPage.dart';
import 'package:where_to/Widgets/NavigationMenu.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'WhereTo',
          style: TextStyle(color: Colors.orange, fontSize: 33),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.sms,
              color: Colors.orange,
              size: size.width * 0.10,
            ),
            onPressed: () {},
          ),
          Container(
            width: size.width * 0.05,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  width: size.width,
                  child: Stack(),
                ))
          ],
        ),
      ),
      bottomNavigationBar: NavigationMenu(),
    );
  }
}
