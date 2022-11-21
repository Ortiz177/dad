import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:where_to/Screens/MessagePage.dart';
import 'package:where_to/Widgets/NavigationMenu.dart';
import 'package:where_to/Widgets/Post.dart';

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
              Icons.send,
              color: Colors.orange,
              size: size.width * 0.10,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessagePage()));
            },
          ),
          Container(
            width: size.width * 0.05,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Post(imagesrc: 'assets/parque.png'),
            Post(imagesrc: 'assets/parque2.png'),
            Post(imagesrc: 'assets/parque3.png'),
            Post(imagesrc: 'assets/parque4.png')
          ],
        ),
      ),
      bottomNavigationBar: Stack(children: [NavigationMenu()]),
    );
  }
}
