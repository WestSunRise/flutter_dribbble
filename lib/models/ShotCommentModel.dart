import 'package:flutter_dribbble/models/UserModel.dart';

class ShotCommentModel {
  final int id;
  final String body;
  final int likesCount;
  final String likesUrl;
  final String createdAt;
  final String updatedAt;
  final UserModel user;

  ShotCommentModel({
    this.id,
    this.body,
    this.likesCount,
    this.likesUrl,
    this.createdAt,
    this.updatedAt,
    this.user
  });

  factory ShotCommentModel.fromJson(Map<String, dynamic> json) {
    return new ShotCommentModel(
      id: json['id'],
      body: json['body'],
      likesCount: json['likes_count'],
      likesUrl: json['likesUrl'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: new UserModel.fromJson(json['user']),
    );
  }
}