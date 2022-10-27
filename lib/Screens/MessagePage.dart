import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:where_to/Screens/WelcomePage.dart';
import 'package:where_to/Widgets/NavigationMenu.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.orange,
                size: size.width * 0.10,
              ),
              onPressed: () {
                Navigator.of(context).push(_routeHome());
              },
            );
          },
        ),
        title: Text(
          'WhereTo',
          style: TextStyle(color: Colors.orange, fontSize: 33),
        ),
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
    );
  }
}

Route _routeHome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const WelcomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
