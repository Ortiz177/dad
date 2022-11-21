import 'package:flutter/material.dart';
import 'package:where_to/Widgets/Like.dart';

class Post extends StatelessWidget {
  final String imagesrc, textPost;
  Post({Key? key, required this.imagesrc, required this.textPost})
      : super(key: key);
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
            '${imagesrc}',
            fit: BoxFit.fitWidth,
            width: 300,
          ),
        ),
        Row(
          children: <Widget>[
            Text('${textPost}'),
            Spacer(),
            Like(),
          ],
        )
      ]),
    );
  }
}
