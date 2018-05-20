import 'package:redux/redux.dart';

import 'package:flutter_dribbble/models/AppState.dart';
import 'package:flutter_dribbble/Actions.dart';
import 'package:flutter_dribbble/modules/client.dart' as Client;
import 'package:flutter_dribbble/models/ShotModel.dart';

handleActionsMiddleware (Store<AppState> store, action, NextDispatcher next) {
  print('[middleware] action: ${action.runtimeType}');
  if (action is FetchShotsAction) {
    handleFetchPopuarListAction(store, action);
  }

  next(action);
}

handleFetchPopuarListAction (Store<AppState> store, FetchShotsAction action) async {
  ShotsState shotsState = getShotsState(action.tabTitle, store.state);
  var params = Client.getShotsApiParams(action.tabTitle);

  print('action.tabTitle: ${action.tabTitle},  shots.length: ${shotsState.shots.length},  action.page: ${action.page}');

  // When the tab switch is not fetch
  if (shotsState.shots.length > 0 && action.page == 1) {
    return;
  }
  List<ShotModel> shots = await Client.Shot.getList(sort: params['sort'], list: params['list'], page: action.page);
  store.dispatch(
    new SaveShotsAction(
      tabTitle: action.tabTitle,
      shots: shots,
      page: action.page
    )
  );
}