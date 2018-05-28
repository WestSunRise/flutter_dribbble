import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import 'package:flutter_dribbble/models/ShotModel.dart';

class Profile extends StatelessWidget {
  final ShotModel shot;

  Profile(
    this.shot
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          _buildAvatar(),
          _buildInfo()
        ]
      )
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      _buildTitle(),
      _buildByLine()
    ]);
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.only(bottom: 6.0),
      child: Text(
        shot.title,
        textAlign: TextAlign.left,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildByLine() {
    String createdAt = new DateFormat.yMMMMd().format(DateTime.parse(shot.createdAt));

    Row row = Row(
      children: <Widget>[
      Text('by', style: TextStyle(fontSize: 12.0)),
      GestureDetector(
        onTap: () {
          print('onTap');
        },
        child: Text(
          ' ' + shot.user.name,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 12.0
          )
        ),
      )
    ]);

    if (shot.team != null) {
      row.children.addAll(<Widget>[
        Text(' for '),
        GestureDetector(
          onTap: () {

          },
          child: Text(
            ' ' + shot.team.name,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.blueAccent
            ),
          ),
        )
      ]);
    }

    row.children.add(
      Text(' on ' + createdAt, style: TextStyle(fontSize: 12.0))
    );

    return row;
  }

  Widget _buildAvatar() {
    String avatarUrl = shot.user == null ? shot.team.avatarUrl : shot.user.avatarUrl;
    return Container(
      width: 40.0,
      height: 40.0,
      margin: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: CachedNetworkImageProvider(avatarUrl)
        )
      )
    );
  }
}