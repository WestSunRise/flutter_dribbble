import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Shot extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new Container(
        child: new CachedNetworkImage(
          imageUrl: "https://cdn.dribbble.com/users/175166/screenshots/4342022/skillsharedribbb_thumb.jpg",
          placeholder: new CircularProgressIndicator(), 
          errorWidget: new Icon(Icons.error), 
          alignment: Alignment.center,
          // fit: BoxFit.cover,
        ),
      );
    }
}