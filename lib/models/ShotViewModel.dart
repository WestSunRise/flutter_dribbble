import 'package:flutter_dribbble/models/ShotCommentModel.dart';
import 'package:flutter_dribbble/models/ShotModel.dart';

class ShotViewModel {
  final ShotModel shot;
  final List<ShotCommentModel> comments;
  final bool commentLoading;
  final int commentCount;

  ShotViewModel({
    this.shot,
    this.comments,
    this.commentCount,
    this.commentLoading
  });
}