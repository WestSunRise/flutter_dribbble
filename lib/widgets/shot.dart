import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';
import 'package:flutter_dribbble/routes.dart';

class Shot extends StatelessWidget {
  final ShotModel shot;
  final int shotIndex;
  final String tabTitle;

  Shot({
    this.shot,
    this.tabTitle,
    this.shotIndex,
  });

  @override
    Widget build(BuildContext context) {
      return new GestureDetector(
        onTap: () {
          Routes.getInstance().navigateTo(
            context,
            '/shots/' + shot.id.toString() + '?tabTitle=' + tabTitle + '&shotIndex=' + shotIndex.toString(),
            transition: TransitionType.custom,
            transitionBuilder: (context, animation, secondaryAnimation, child) => new FadeTransition(opacity: animation, child: child),
          );
          print('tap shot : ${shot.id}');
        },
        child: new Hero(
          tag: 'tag:shot-${shot.id}',
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