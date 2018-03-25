import 'package:flutter_dribbble/models/UserModel.dart';
import 'package:flutter_dribbble/models/ImagesModel.dart';

class ShotModel {
  final int id;
  final String title;
  final bool animated;
  final String description;
  final int likesCount;
  final int viewsCount;
  final int commentsCount;
  final String htmlUrl;
  final String createdAt;
  final UserModel team;
  final UserModel user;
  final ImagesModel images;
  final List<String> colorHexes;

  ShotModel({
    this.id,
    this.title,
    this.animated,
    this.description,
    this.likesCount,
    this.viewsCount,
    this.commentsCount,
    this.htmlUrl,
    this.createdAt,
    this.team,
    this.user,
    this.images,
    this.colorHexes
  });

  factory ShotModel.fromJson(Map<String, dynamic> json) {
    return new ShotModel(
      id: json['id'],
      title: json['title'],
      animated: json['animated'],
      description: json['description'],
      likesCount: json['likes_count'],
      viewsCount: json['views_count'],
      commentsCount: json['comments_count'],
      htmlUrl: json['html_url'],
      createdAt: json['created_at'],
      team: json['team'] != null ? new UserModel.fromJson(json['team']) : null,
      user: new UserModel.fromJson(json['user']),
      images: new ImagesModel.fromJson(json['images']),
      colorHexes: json['color_hexes']
    );
  }
}