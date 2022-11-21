import 'package:flutter/material.dart';

class Like extends StatefulWidget {
  const Like({Key? key}) : super(key: key);
  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  Color _favIconColor = Colors.grey;

  @override
  Widget build(context) {
    return IconButton(
        icon: Icon(Icons.favorite),
        color: _favIconColor,
        onPressed: () {
          setState(() {
            _favIconColor == Colors.grey
                ? _favIconColor = Colors.red
                : _favIconColor = Colors.grey;
          });
        });
  }
}
