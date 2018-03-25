import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';

class Shot extends StatelessWidget {
  final ShotModel shot;

  Shot(this.shot);

  @override
    Widget build(BuildContext context) {
      return new GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/shots/${shot.id}');
          print('tap shot : ${shot.id}');
        },
        child: new Container(
          child: new CachedNetworkImage(
            imageUrl: shot.images.normal,
            placeholder: new Center(
                child: new CircularProgressIndicator(strokeWidth: 2.0),
            ),
            errorWidget: new Icon(Icons.error), 
            alignment: Alignment.center
          ),
        ),
      );
    }
}