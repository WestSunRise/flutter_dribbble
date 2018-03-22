import 'package:flutter/material.dart';
import 'package:flutter_dribbble/widgets/shot.dart';

class Shots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(14.0),
      crossAxisSpacing: 16.0,
      crossAxisCount: 2,
      childAspectRatio: 1.15,
      children: <Widget>[
        new Shot(),
        new Shot(),
        new Shot(),
        new Shot(),
        new Shot(),
        new Shot(),
        new Shot(),
        new Shot(),
        new Shot(),
        new Shot(),
        new Shot(),
        new Shot(),
      ],
    );
  }
}