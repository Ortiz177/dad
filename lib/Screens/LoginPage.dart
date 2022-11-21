import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:where_to/Screens/RegisterPage.dart';
import 'package:where_to/Screens/TestData.dart';
import 'package:where_to/Screens/WelcomePage.dart';
import 'package:where_to/providers/data_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class Foo {
  static String name1 = "null";
  static String email1 = "null";
  static String pass1 = "null";
  static void func(String name, String email, String pass) {
    name1 = name;
    email1 = email;
    pass1 = pass;
  }
}

class _LoginPageState extends State<LoginPage> {
  int currentIndex = 0;
  List<dynamic> ClavesDB = [];
  List<dynamic> NamesDB = [];
  List<dynamic> EmailsDB = [];
  String Logueo = "1";
  final myControllerPass = TextEditingController();
  final myControllerEmail = TextEditingController();
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  LoadData(String pass, String email) {
    var value = rootBundle.loadString('data/users.json').then((value) {
      List<dynamic> data = json.decode(value);
      data.forEach((k) => ClavesDB.add(k["pass"]));
      data.forEach((k) => NamesDB.add(k["name"]));
      ClavesDB.forEach((element) {
        print(element);
      });

      data.forEach((k) => EmailsDB.add(k["email"]));
      EmailsDB.forEach((element) {
        print(element);
      });
      Logueo = ClavesDB.contains(pass)
          ? EmailsDB.contains(email)
              ? ClavesDB.indexOf(pass) == EmailsDB.indexOf(email)
                  ? ClavesDB.indexOf(pass) != (-1)
                      ? EmailsDB.indexOf(email) != (-1)
                          ? "pasa"
                          : "no pasa"
                      : "no pasa"
                  : "no pasa"
              : "no pasa"
          : "no pasa";
      Logueo == "pasa"
          ? Navigator.push(
              context, MaterialPageRoute(builder: (context) => WelcomePage()))
          : "";
      print(Logueo);
      print(ClavesDB.indexOf(pass));
      print(EmailsDB.indexOf(email));
    });
    ClavesDB.add(Foo.pass1);
    NamesDB.add(Foo.name1);
    EmailsDB.add(Foo.email1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Bienvenido\nNuevamente',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: myControllerEmail,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Contraseña",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: myControllerPass,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ingresar',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                child: IconButton(
                                    color: Color.fromARGB(255, 92, 195, 255),
                                    onPressed: () {
                                      LoadData(myControllerPass.text,
                                          myControllerEmail.text);
                                    },
                                    icon: Icon(
                                      Icons.login,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyRegister()));
                                },
                                child: Text(
                                  'Crear cuenta',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '¿Contraseña?',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
