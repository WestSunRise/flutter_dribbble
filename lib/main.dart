import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_dribbble/app.dart';
import 'package:flutter_dribbble/routes.dart';
import 'package:flutter_dribbble/models/AppState.dart';
import 'package:flutter_dribbble/reducers/AppStateReducer.dart';
import 'package:flutter_dribbble/modules/HandleActionsMiddleware.dart';

void main() => runApp(new App());

class App extends StatelessWidget {

  final Router router = new Router();
  final store = new Store<AppState>(
    reducer,
    initialState: new AppState(
      popualShotsState: new ShotsState(shots: [], loading: true, page: 1),
      recentShotsState: new ShotsState(shots: [], loading: false, page: 1),
      teamsShotsState: new ShotsState(shots: [], loading: false, page: 1)
    ),
    middleware: [
      handleActionsMiddleware
    ].toList()
  );

  App() {
    Routes.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Dribbble',
        home: new DribbbleApp(),
        onGenerateRoute: Routes.router.generator
      ),
    );
  }
}
