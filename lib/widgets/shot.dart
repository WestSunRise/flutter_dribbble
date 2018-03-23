import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';

class Shot extends StatelessWidget {
  final ShotModel shot;

  Shot({
    this.shot
  });

  @override
    Widget build(BuildContext context) {
      return new Container(
        child: new CachedNetworkImage(
          imageUrl: shot.images.normal,
          placeholder: new Center(
            child: new CircularProgressIndicator(),
          ), 
          errorWidget: new Icon(Icons.error), 
          alignment: Alignment.center,
          // fit: BoxFit.cover,
        ),
      );
    }
}