import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_dribbble/models/AppState.dart';

import 'package:flutter_dribbble/models/ShotModel.dart';

class ShotScreen extends StatelessWidget {
  
  final String shotId;
  final String tabTitle;
  final String shotIndex;

  ShotScreen({
    this.shotId,
    this.shotIndex,
    this.tabTitle
  });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ShotModel>(
      converter: (store) {
        ShotsState shotsState = getShotsState(tabTitle, store.state);
        return shotsState.shots[int.parse(shotIndex)];
      },
      builder: (BuildContext context, ShotModel shot) {
        return new Scaffold(
          body: new CustomScrollView(
            slivers: <Widget>[
              _buildShotImage(shot)
            ]
          )
        );
      },
      onInit: (store) {

      },
    );
  }
  

  Widget _buildShotImage(ShotModel shot) {
    return new SliverAppBar(
      expandedHeight: 240.0,
      pinned: true,
      flexibleSpace: new FlexibleSpaceBar(
        background: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Hero(
              tag: 'tag:shot-${this.shotId}',
              child: new CachedNetworkImage(
                imageUrl: shot.images.normal,
                placeholder: new Center(
                    child: new CircularProgressIndicator(strokeWidth: 2.0),
                ),
                errorWidget: new Icon(Icons.error), 
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}