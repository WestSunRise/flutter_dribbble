class UserModel {
  final String name;
  final String username;
  final String avatarUrl;

  UserModel({
    this.name,
    this.username,
    this.avatarUrl
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return new UserModel(
      name: json['name'],
      username: json['username'],
      avatarUrl: json['avatar_url']
    );
  }
}