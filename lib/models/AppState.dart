import 'package:meta/meta.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';
import 'package:flutter_dribbble/models/ShotCommentModel.dart';

@immutable
class AppState {
  final ShotsState popualShotsState;
  final ShotsState recentShotsState;
  final ShotsState teamsShotsState;
  final ShotCommentState shotCommentState;

  const AppState({
    this.popualShotsState = const ShotsState(),
    this.recentShotsState = const ShotsState(),
    this.teamsShotsState = const ShotsState(),
    this.shotCommentState = const ShotCommentState()
  });

  AppState copyWith({
    ShotsState popualShotsState,
    ShotsState recentShotsState,
    ShotsState teamsShotsState,
    ShotCommentState shotCommentState,
  }) {
    return new AppState(
      popualShotsState: popualShotsState ?? this.popualShotsState,
      recentShotsState: recentShotsState ?? this.recentShotsState,
      teamsShotsState: teamsShotsState ?? this.teamsShotsState,
      shotCommentState: shotCommentState ?? this.shotCommentState,
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

@immutable
class ShotCommentState {
  final List<ShotCommentModel> comments;
  final bool loading;
  final int page;
  final String errorMsg;

  const ShotCommentState({
    this.comments,
    this.loading,
    this.page,
    this.errorMsg
  });


  ShotCommentState copyWith({
    List<ShotCommentModel> comments,
    bool loading,
    int page,
    String errorMsg,
  }) {
    return new ShotCommentState(
      comments: comments ?? this.comments,
      loading: loading ?? this.loading,
      page: page ?? this.page,
      errorMsg: errorMsg ?? this.errorMsg
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