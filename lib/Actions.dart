
import 'package:flutter_dribbble/models/ShotModel.dart';

class FetchShotsAction {
  final String tabTitle;
  final int page;

  FetchShotsAction({
    this.tabTitle,
    this.page
  });
}

class SaveShotsAction {
  final String tabTitle;
  final List<ShotModel> shots;
  final int page;

  SaveShotsAction({
    this.tabTitle,
    this.shots,
    this.page
  });
}

enum Actions {
  FetchPopuarList,
  FetchPopuarListDone,
  FetchPopuarListError,

  FetchRecentList,
  FetchRecentListDone,
  FetchRecentListError,

  FetchTeamsList,
  FetchTeamsListDone,
  FetchTeamsListError,
}