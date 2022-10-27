import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:where_to/Screens/WelcomePage.dart';
import 'package:where_to/Screens/MapPage.dart';
import 'package:where_to/Widgets/NavigationMenu.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange,
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
