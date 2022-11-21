import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:where_to/Screens/MessagePage.dart';
import 'package:where_to/Screens/LoginPage.dart';
import 'package:where_to/Screens/WelcomePage.dart';
import 'package:where_to/Screens/MapPage.dart';
import 'package:where_to/Widgets/NavigationMenu.dart';
import 'package:where_to/Widgets/Post.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              ActualUser.nameactuall,
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Roboto"),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                Text(
                                  '  3',
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "Roboto"),
                                )
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.room,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "Roboto"),
                                )
                              ],
                            )
                          ],
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Row(
                          children: [],
                        )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset(
                                'assets/parque.png',
                                fit: BoxFit.fitWidth,
                                width: size.width / 3,
                              ),
                              Image.asset(
                                'assets/parque2.png',
                                fit: BoxFit.fitWidth,
                                width: size.width / 3,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset(
                                'assets/parque3.png',
                                fit: BoxFit.fitWidth,
                                width: size.width / 3,
                              ),
                              Image.asset(
                                'assets/parque4.png',
                                fit: BoxFit.fitWidth,
                                width: size.width / 3,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (buildcontext) {
                  return AlertDialog(
                    title: Text('Agregar nueva publicación'),
                    actions: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.photo_camera,
                                  color: Colors.orange,
                                  size: 50,
                                ),
                                Container(
                                  width: size.width * 0.05,
                                ),
                                Icon(
                                  Icons.photo_camera_back,
                                  color: Colors.orange,
                                  size: 50,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: "Pie de foto",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancelar');
                                      },
                                      child: Text('Cancelar')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Publicar');
                                      },
                                      child: Text('Publicar'))
                                ]),
                          )
                        ],
                      )
                    ],
                  );
                });
          },
          backgroundColor: Colors.orange,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: Stack(children: [NavigationMenu()]));
  }
}
