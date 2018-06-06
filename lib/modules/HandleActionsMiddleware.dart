import 'package:redux/redux.dart';

import 'package:flutter_dribbble/models/AppState.dart';
import 'package:flutter_dribbble/Actions.dart';
import 'package:flutter_dribbble/modules/client.dart' as Client;
import 'package:flutter_dribbble/models/ShotModel.dart';
import 'package:flutter_dribbble/models/ShotCommentModel.dart';

handleActionsMiddleware (Store<AppState> store, action, NextDispatcher next) {
  print('[middleware] action: ${action.runtimeType}');
  if (action is FetchShotsAction) {
    handleFetchShotsAction(store, action);
  }

  if (action is FetchShotCommentsAction) {
    handleFetchShotCommentsAciton(store, action);
  }

  next(action);
}

handleFetchShotsAction (Store<AppState> store, FetchShotsAction action) async {
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

handleFetchShotCommentsAciton (Store<AppState> store, FetchShotCommentsAction action) async {
  List<ShotCommentModel> comments = await Client.Shot.getComments(shotId: action.shotId, page: action.page);

  store.dispatch(
    new SaveShotCommentsAction(
      shotId: action.shotId,
      comments: comments,
      errorMsg: null,
      page: action.page
    )
  );
}