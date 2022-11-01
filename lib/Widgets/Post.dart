import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  Color _favIconColor = Colors.grey;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(
          children: <Widget>[Icon(Icons.account_circle), Text("Pablo")],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.asset(
            'assets/parque2.png',
            fit: BoxFit.fitWidth,
            width: 300,
          ),
        ),
        Row(
          children: <Widget>[
            Text("Que bonito"),
            Spacer(),
            IconButton(
                icon: Icon(Icons.favorite),
                color: _favIconColor,
                onPressed: () {
                  setState(() {
                    if (_favIconColor == Colors.grey) {
                      _favIconColor = Colors.red;
                    } else {
                      _favIconColor = Colors.grey;
                    }
                  });
                }),
          ],
        )
      ]),
    );
  }
}
