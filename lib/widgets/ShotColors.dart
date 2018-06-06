import 'package:flutter/material.dart';

import 'package:flutter_dribbble/models/ShotModel.dart';
import 'package:flutter_dribbble/utils/colors.dart' as MyColors;
import 'package:flutter_dribbble/utils/utils.dart' as Utils;

class ShotColors extends StatelessWidget {
  final ShotModel shot;

  ShotColors(
    this.shot
  );

  @override
  Widget build(BuildContext context) {
    if (shot.colorHexes.length == 0) {
      return Container();
    }
    
    return Container(
      padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 15.0, right: 25.0),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grayLight, width: 1.0)
      ),
      child: Row(children: <Widget>[
        _buildIcon(),
        SizedBox(width: 18.0)
      ]..addAll(_buildColors())),
    );
  }

  Widget _buildIcon() {
    return Icon(
      Icons.color_lens,
      color: MyColors.gray,
      size: 28.0,
    );
  }

  List<Widget> _buildColors() {
    return shot.colorHexes.map((colorHex) {
      return Expanded(
        flex: 1,
        child: Container(color: Utils.hexToColor(colorHex), height: 26.0),
      );
    }).toList();
  }
}