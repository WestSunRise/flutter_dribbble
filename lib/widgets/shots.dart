import 'dart:async';
import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';

import 'package:flutter_dribbble/widgets/shot.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';

import 'package:flutter_dribbble/modules/client.dart' as Client;

class Shots extends StatefulWidget {
  final String tabTitle;

  Shots({Key key, this.tabTitle}) : super(key: key);
  
  @override
  ShotsState createState () => new ShotsState(tabTitle);
}

class ShotsState extends State<Shots> {
  final GlobalKey<AsyncLoaderState> _asyncLoaderState = new GlobalKey<AsyncLoaderState>();
  final String tabTitle;
  final ScrollController scrollController = new ScrollController();
  List<ShotModel> shots;
  int page = 1;
  bool fetching;

  ShotsState(this.tabTitle);

  Future<List<ShotModel>> _getList (int _page) async {
    fetching = true;
    var future;
    switch (tabTitle) {
      case 'RECENT':
        future = await Client.Shot.getList(sort: 'recent', page: _page);
        break;
      case 'TEAMS':
        future = await Client.Shot.getList(list: 'team', page: _page);
        break;
      case 'POPLUAR':
      default:
        future = await Client.Shot.getList(page: _page);
        break;
    }
    fetching = false;
    return future;
  }
  
  @override
  Widget build(BuildContext context) {
    return new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await _getList(page),
      renderLoad: () => new Center(child: new CircularProgressIndicator()),
      renderError: ([ error ]) => new Center(child: new Text('error: ${error.toString()}')),
      renderSuccess: ({ data }) {
        shots = data;

        return new RefreshIndicator(
          onRefresh: _onRefresh,
          child: new GridView.builder(
            controller: scrollController,
            itemCount: shots.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16.0,
              crossAxisCount: 2,
              childAspectRatio: 1.18,
            ),
            padding: const EdgeInsets.all(14.0),
            itemBuilder: (BuildContext context, int index) {
              if (index > (shots.length * 0.8) && !fetching) {
                _loadNextPage();
              }
              return new Shot(shots[index]);
            },
          )
        );
      },
    );
  }

  Future _onRefresh() async {
    page = 1;

    try {
      var newShots = await _getList(page);
      setState(() {
        shots = [];
        shots.addAll(newShots);
      });
    } catch (e) {
      // TODO
    }
  }
  
  void _loadNextPage() async {
    ++page;
    try {
      var newShots = await _getList(page);
      setState(() {
        shots.addAll(newShots);
      });
    } catch (e) {
      // TODO 
    }
  }
}