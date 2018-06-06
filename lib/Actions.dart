
import 'package:flutter_dribbble/models/ShotModel.dart';
import 'package:flutter_dribbble/models/ShotCommentModel.dart';

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


class FetchShotCommentsAction {
  final int shotId;
  final int page;

  FetchShotCommentsAction({
    this.shotId,
    this.page
  });
}

class SaveShotCommentsAction {
  final int shotId;
  final String errorMsg;
  final List<ShotCommentModel> comments;
  final int page;

  SaveShotCommentsAction({
    this.shotId,
    this.comments,
    this.errorMsg,
    this.page
  });
}