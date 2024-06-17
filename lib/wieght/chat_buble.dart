// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class cahtbuble extends StatelessWidget {
  final String text;
  final bool? lol;
  cahtbuble({
    required this.text,
    required this.lol,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> color = [];
    if (Theme.of(context).brightness == Brightness.dark) {
      color = [Colors.orange, Colors.green];
    } else {
      color = [Colors.red, Colors.blue];
    }
    return Align(
      alignment: lol! ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        decoration: BoxDecoration(
          color: lol! ? color[0] : color[1],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Text('$text', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
