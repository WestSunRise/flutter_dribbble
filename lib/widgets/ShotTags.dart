import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_dribbble/models/ShotModel.dart';
import 'package:flutter_dribbble/utils/colors.dart' as MyColors;

class ShotTags extends StatelessWidget {
  final ShotModel shot;

  ShotTags(
    this.shot
  );

  @override
  Widget build(BuildContext context) {
    if (shot.tags.length == 0) {
      return Container();
    }
    
    return Container(
      padding: new EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
      child: RichText(
        maxLines: 1,
        // overflow: TextOverflow.fade,
        text: TextSpan(
          children: <TextSpan> [
            TextSpan(
              text: 'Tags:   ',
              style: TextStyle(color: Colors.grey)
            )
          ] + _buildTags()
        ),
      ),
    );
  }

  List<TextSpan> _buildTags() {
    List<TextSpan> tags = shot.tags.map((String tag) {
      return TextSpan(
        text: tag + '  ',
        style: TextStyle(
          color: MyColors.grayD3
        ),
        recognizer: recognizer(tag)
      );
    }).toList();
    
    return tags;
  }

  TapGestureRecognizer recognizer (String tag) {
    return new TapGestureRecognizer()..onTap = (){
      print('tag tap: ' + tag);
    };
  }

}