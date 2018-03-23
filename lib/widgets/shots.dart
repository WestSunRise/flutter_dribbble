import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_dribbble/widgets/shot.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';

import 'package:flutter_dribbble/modules/client.dart' as Client;

class Shots extends StatelessWidget {
  final String tabTitle;
  Shots({
    this.tabTitle
  });
  
  Widget shotsBuilder(BuildContext context, AsyncSnapshot<List<ShotModel>> snapshot) {
    if (snapshot.hasError) {
      return new Center(
        child: new Text("${snapshot.error}")
      );
    }
    if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError) {
      return new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(14.0),
        crossAxisSpacing: 16.0,
        crossAxisCount: 2,
        childAspectRatio: 1.15,
        children: snapshot.data.map((shot) => new Shot(shot: shot)).toList()
      );
    }

    return new Center(child: new CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    Future<List<ShotModel>> future;

    switch (tabTitle) {
      case 'RECENT':
        future = Client.Shot.getList(sort: 'recent');
        break;
      case 'TEAMS':
        future = Client.Shot.getList(list: 'team');
        break;
      case 'POPLUAR':
      default:
        future = Client.Shot.getList();
        break;  
    }

    return new FutureBuilder(
      builder: shotsBuilder,
      future: future,
    );
  }
}