import 'package:flutter/material.dart';

import 'package:flutter_dribbble/models/ShotModel.dart';
import 'package:flutter_dribbble/utils/colors.dart' as MyColors;

enum StatState {
    LIKE,
    VIEW,
    COMMENT
}
  
class ShotStats extends StatelessWidget {
  final ShotModel shot;

  ShotStats(
    this.shot
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      color: MyColors.grayLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildItem(StatState.VIEW),
          _buildItem(StatState.COMMENT),
          _buildItem(StatState.LIKE),
        ],
      ),
    );
  }

  Widget _buildItem(StatState state) {
    return GestureDetector(
      onTap: () {
        print('print');
      },
      child: Row(
        children: <Widget>[
          Icon(
            getItemIcon(state),
            size: 18.0,
            color: MyColors.gray,
          ),
          SizedBox(width: 8.0),
          Text(
            getItemValue(state),
            style: TextStyle(color: MyColors.gray)
          )
        ]
      )
    );
  }

  IconData getItemIcon(StatState state) {
    switch(state) {
      case StatState.COMMENT:
        return Icons.mode_comment;
        break;
      case StatState.LIKE:
        return Icons.favorite;
        break;
      case StatState.VIEW:
        return Icons.remove_red_eye;
        break;
      default:
        return null;
    }
  }

  String getItemValue(StatState state) {
    switch(state) {
      case StatState.COMMENT:
        return shot.commentsCount.toString();
        break;
      case StatState.LIKE:
        return shot.likesCount.toString();
        break;
      case StatState.VIEW:
        return shot.viewsCount.toString();
        break;
      default:
        return '';
    }
  }
}