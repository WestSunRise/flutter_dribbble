import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter_dribbble/models/ShotModel.dart';

class ShotScreen extends StatelessWidget {
  
  // final ShotModel shot;

  // ShotScreen(this.shot);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          _buildShotImage()
        ]
      )
    );
  }

  Widget _buildShotImage() {
    return new SliverAppBar(
      expandedHeight: 240.0,
      pinned: true,
      flexibleSpace: new FlexibleSpaceBar(
        background: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Hero(
              tag: "Movie-Tag-1",
              child: new CachedNetworkImage(
                imageUrl: 'https://cdn.dribbble.com/users/1094383/screenshots/4384462/800x600-v-2_4_1x.gif',
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