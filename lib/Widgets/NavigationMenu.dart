import 'package:flutter/material.dart';
import 'package:where_to/Screens/UserPage.dart';
import 'package:where_to/Screens/MapPage.dart';
import 'package:where_to/Screens/WelcomePage.dart';

int currentIndex = 0;

class NavigationMenu extends StatefulWidget {
  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          width: size.width,
          height: 80,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: Size(size.width, 80),
                painter: BNBCustomPainter(),
              ),
              Center(
                heightFactor: 0.6,
                child: FloatingActionButton(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.room),
                    elevation: 0.1,
                    onPressed: () {
                      setBottomBarIndex(2);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapPage()));
                    }),
              ),
              Container(
                width: size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        //color: Colors.orange,
                        color: currentIndex == 0
                            ? Colors.orange
                            : currentIndex != 2
                                ? Colors.grey.shade400
                                : Colors.white,
                        size: size.width * 0.10,
                      ),
                      onPressed: () {
                        setBottomBarIndex(0);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()));
                      },
                      splashColor: Colors.white,
                    ),
                    Container(
                      width: size.width * 0.20,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          //color: Colors.grey.shade400,
                          color: currentIndex == 4
                              ? Colors.orange
                              : currentIndex != 2
                                  ? Colors.grey.shade400
                                  : Colors.white,
                          size: size.width * 0.10,
                        ),
                        onPressed: () {
                          setBottomBarIndex(4);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserPage()));
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = currentIndex == 2 ? Colors.orange : Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    //path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    //path.lineTo(0, 20);
    //canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
