import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:where_to/Screens/ChatPage.dart';
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
                  Navigator.of(context).push(_routeHome(WelcomePage(), -1));
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
          margin: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).push(_routeHome(ChatPage(), 1)),
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_circle_outlined,
                        size: 50,
                      ),
                      Spacer(),
                      Text(
                        "Andres Felipe Saldarriaga",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

Route _routeHome(page, x) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const beginr = Offset(-1.0, 0.0);
      const beginl = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: x == 1 ? beginl : beginr, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
