class UserModel {
  final int id;
  final String name;
  final String username;
  final String avatarUrl;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.avatarUrl
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return new UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      avatarUrl: json['avatar_url']
    );
  }
}