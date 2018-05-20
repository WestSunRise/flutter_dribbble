
import 'package:flutter_dribbble/models/AppState.dart';
import 'package:flutter_dribbble/Actions.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';

AppState reducer(AppState prevState, action) {
  // TODO
  if (action is FetchShotsAction) {
    ShotsState shotsState = getShotsState(action.tabTitle, prevState);
    print('[FetchShotsAction] run reducer ${action.tabTitle}');
    if (shotsState.shots.length != 0 && action.page != 1) {
      switch(action.tabTitle) {
        case 'POPLUAR':
          AppState state = prevState.copyWith(
            popualShotsState: prevState.popualShotsState.copyWith(
              loading: true
            )
          );
          return state;
          break;
        case 'RECENT':
          return prevState.copyWith(
            recentShotsState: prevState.recentShotsState.copyWith(
              loading: true
            )
          );
          break;
        case 'TEAMS':
          return prevState.copyWith(
            teamsShotsState: prevState.teamsShotsState.copyWith(
              loading: true
            )
          );
          break;
        default: 
      }
    }
  }

  if (action is SaveShotsAction) {
    List<ShotModel> shots = new List.from(action.shots);
    switch(action.tabTitle) {
      case 'POPLUAR':
        if (action.page != 1) {
          shots.insertAll(0, prevState.popualShotsState.shots);
        }
        print('shots length ${shots.length} prevShots.length ${prevState.popualShotsState.shots.length}');
        return prevState.copyWith(
          popualShotsState: prevState.popualShotsState.copyWith(
            loading: false,
            shots: shots,
            page: action.page
          )
        );
        break;
      case 'RECENT':
        if (action.page != 1) {
          shots.insertAll(0, prevState.popualShotsState.shots);
        }
        return prevState.copyWith(
          recentShotsState: prevState.recentShotsState.copyWith(
            loading: false,
            shots: shots,
            page: action.page
          )
        );
        break;
      case 'TEAMS':
        return prevState.copyWith(
          teamsShotsState: prevState.teamsShotsState.copyWith(
            loading: false,
            shots: shots,
            page: action.page
          )
        );
        break;
      default: 
    }
  }
  
  return prevState;
}