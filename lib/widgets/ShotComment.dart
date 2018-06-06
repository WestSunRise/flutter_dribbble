import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dribbble/models/ShotCommentModel.dart';
import 'package:flutter_dribbble/utils/colors.dart' as MyColors;

import 'package:flutter_html_view/html_parser.dart';

class ShotComment extends StatelessWidget {
  final ShotCommentModel comment;

  ShotComment(
    this.comment
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 20.0, right: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildInfo()
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 7.0),
          child: Text(comment.user.name,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16.0,
              color: MyColors.darkBlack
            ),
            maxLines: 1,
          ),
        ),
        _buildCommentContent(),
        _buildOperation()
      ],
    );
  }

  Widget _buildCommentContent() {
    HtmlParser htmlParser = new HtmlParser();
    List<Widget> nodes = htmlParser.HParse(comment.body);
    
    return Container(
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Column(
        children: nodes,
        crossAxisAlignment: CrossAxisAlignment.start
      )
    );
  }

  Widget _buildOperation() {
    String createdAt = new DateFormat.yMMMMd().format(DateTime.parse(comment.createdAt));

    return RichText(
      maxLines: 1,
      text: TextSpan(
        style: TextStyle(
          color: MyColors.gray,
          fontSize: 12.0
        ),
        children: <TextSpan> [
          TextSpan(text: '   $createdAt     '),
          TextSpan(text: 'Like ?')
        ]
      )
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 34.0,
      height: 34.0,
      margin: EdgeInsets.only(right: 6.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: CachedNetworkImageProvider(comment.user.avatarUrl)
        )
      )
    );
  }
  
}