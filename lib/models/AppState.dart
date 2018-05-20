import 'package:meta/meta.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';

@immutable
class AppState {
  final ShotsState popualShotsState;
  final ShotsState recentShotsState;
  final ShotsState teamsShotsState;

  const AppState({
    this.popualShotsState = const ShotsState(),
    this.recentShotsState = const ShotsState(),
    this.teamsShotsState = const ShotsState()
  });

  AppState copyWith({
    ShotsState popualShotsState,
    ShotsState recentShotsState,
    ShotsState teamsShotsState
  }) {
    return new AppState(
      popualShotsState: popualShotsState ?? this.popualShotsState,
      recentShotsState: recentShotsState ?? this.recentShotsState,
      teamsShotsState: teamsShotsState ?? this.teamsShotsState
    );
  }
}

@immutable
class ShotsState {
  final List<ShotModel> shots;
  final bool loading;
  final int page;

  const ShotsState({
    this.shots,
    this.loading,
    this.page
  });

  ShotsState copyWith({
    List<ShotModel> shots,
    bool loading,
    int page
  }) {
    return new ShotsState(
      shots: shots ?? this.shots,
      loading: loading ?? this.loading,
      page: page ?? this.page
    );
  }
}


ShotsState getShotsState (String tabTitle, AppState appState) {
  switch (tabTitle) {
    case 'RECENT':
      return appState.recentShotsState;
      break;
    case 'TEAMS':
      return appState.teamsShotsState;
    case 'POPLUAR':
    default:    
      return appState.popualShotsState;
  }
}