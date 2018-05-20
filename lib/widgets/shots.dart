import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_dribbble/models/ShotModel.dart';

import 'package:flutter_dribbble/models/AppState.dart';
import 'package:flutter_dribbble/Actions.dart';
import 'package:flutter_dribbble/modules/client.dart' as Client;
import 'package:flutter_dribbble/models/ShotsViewModel.dart';

import 'package:flutter_dribbble/widgets/shot.dart';

class Shots extends StatefulWidget {
  final String tabTitle;

  Shots({Key key, this.tabTitle}) : super(key: key);
  
  @override
  _ShotsState createState () => new _ShotsState();
}

class _ShotsState extends State<Shots> {
  final ScrollController scrollController = new ScrollController();
  
  @override
  Widget build(BuildContext context) {
    
    return new StoreConnector<AppState, ShotsViewModel>(
      onWillChange: (ShotsViewModel viewModel) {
        print('->>>>>> change');
      },
      distinct: true,
      converter: (store) {
        
        ShotsState shotsState = getShotsState(widget.tabTitle, store.state);
        
        return new ShotsViewModel(
          shotsState: shotsState,
          onRefresh: () async {
            var params = Client.getShotsApiParams(widget.tabTitle);
            List<ShotModel> shots = await Client.Shot.getList(sort: params['sort'], list: params['list'], page: 1);
            store.dispatch(
              new SaveShotsAction(
                tabTitle: widget.tabTitle,
                shots: shots,
                page: 1
              )
            );
          },
          loadNextPage: () {
            ShotsState shotsState = getShotsState(widget.tabTitle, store.state);
            print('---------->>>>>> ${shotsState.loading}');
            if (!shotsState.loading) {
              store.dispatch(new FetchShotsAction(
                tabTitle: widget.tabTitle,
                page: shotsState.page + 1
              ));
            }
          }
        );
      },
      onInit: (store) {
        store.dispatch(new FetchShotsAction(
          tabTitle: widget.tabTitle,
          page: 1
        ));
      },
      builder: (BuildContext context, ShotsViewModel viewModel) {
        List<Widget> slivers = [
          new SliverPadding(
            padding: const EdgeInsets.all(14.0),
            sliver: new SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16.0,
                crossAxisCount: 2,
                childAspectRatio: 1.18,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index > (viewModel.shotsState.shots.length * 0.8) && !viewModel.shotsState.loading){
                    viewModel.loadNextPage();
                  }
                  return new Shot(viewModel.shotsState.shots[index]);
                },
                childCount: viewModel.shotsState.shots.length
              ),
            ),
          )
        ];
        
        if (viewModel.shotsState.loading) {
          slivers.add(
            new SliverToBoxAdapter(
              child: new Center(
                child: new CircularProgressIndicator(),
              )
            )
          );
        } else {
          if (viewModel.shotsState.shots.length == 0) {
            slivers.add(
              new SliverToBoxAdapter(
                child: new Center(child: new Text('No more'))
              )
            );
          }
        }

        return new RefreshIndicator(
          onRefresh: viewModel.onRefresh,
          child: new CustomScrollView(
            controller: scrollController,
            slivers: slivers,
          )
        );
      },
    );
  }
}