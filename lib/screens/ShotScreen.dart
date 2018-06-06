import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_dribbble/models/AppState.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';
import 'package:flutter_dribbble/models/ShotCommentModel.dart';
import 'package:flutter_dribbble/models/ShotViewModel.dart';


import 'package:flutter_dribbble/utils/utils.dart';
import 'package:flutter_dribbble/Actions.dart';

// widgets
import 'package:flutter_dribbble/widgets/profile.dart';
import 'package:flutter_dribbble/widgets/ShotStats.dart';
import 'package:flutter_dribbble/widgets/ShotTags.dart';
import 'package:flutter_dribbble/widgets/ShotColors.dart';
import 'package:flutter_dribbble/widgets/ShotComment.dart';

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
    return new StoreConnector<AppState, ShotViewModel>(
      onInit: (store) {
        store.dispatch(FetchShotCommentsAction(
          page: 1,
          shotId: int.parse(shotId)
        ));
      },
      converter: (store) {
        ShotsState shotState = getShotsState(tabTitle, store.state);
        ShotCommentState shotCommentState = store.state.shotCommentState;

        return ShotViewModel(
          shot: shotState.shots[int.parse(shotIndex)],
          commentLoading: shotCommentState.loading,
          comments: shotCommentState.comments,
          commentCount: shotCommentState.comments.length
        );
      },
      builder: (BuildContext context, ShotViewModel shotView) {
        ShotModel shot = shotView.shot;

        List<Widget> slivers = <Widget>[
          _buildAppBar(shot),
          SliverToBoxAdapter(child: Profile(shot)),
          SliverToBoxAdapter(child: ShotStats(shot)),
          SliverToBoxAdapter(child: _buildShotDesc(shot)),
          SliverToBoxAdapter(child: ShotTags(shot)),
          SliverToBoxAdapter(child: ShotColors(shot))
        ];

        slivers.addAll(shotView.comments.map((comment) {
          return SliverToBoxAdapter(
            child: ShotComment(comment)
          );
        }));
        
        if (shotView.commentLoading) {
          slivers.add(
            new SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: CircularProgressIndicator()
              )
            )
          );
        } else {
          if (shotView.comments != null && shotView.comments.length == 0) {
            slivers.add(
              new SliverToBoxAdapter(
                child: new Center(child: new Text('No comments'))
              )
            );
          }
        }
        
        return new Scaffold(
          body: new CustomScrollView(
            slivers: slivers
          )
        );
      }
    );
  }
  
  Widget _buildAppBar(ShotModel shot) {
    return new SliverAppBar(
      pinned: true,
      expandedHeight: 340.0,
      backgroundColor: hexToColor(shot.colorHexes[2]),
      flexibleSpace: new FlexibleSpaceBar(
        background: _buildShotImage(shot),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {

          },
        )
      ]
    );
  }

  Widget _buildShotImage(ShotModel shot) {
    return new Hero(
      tag: 'tag:shot-${this.shotId}',
      child: new CachedNetworkImage(
        imageUrl: shot.images.normal,
        placeholder: new Center(
            child: new CircularProgressIndicator(strokeWidth: 2.0),
        ),
        errorWidget: new Icon(Icons.error), 
        alignment: Alignment.bottomCenter,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildShotDesc(ShotModel shot) {
    if (shot.description == null) {
      return Container();
    }
    
    return Container(
      padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0, bottom: 0.0),
      child: HtmlView(data: shot.description)
    );
  }
}