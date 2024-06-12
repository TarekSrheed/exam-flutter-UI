import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CommentsModel {
  String body;
  User user;
  CommentsModel({
    required this.body,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'user': user.toMap(),
    };
  }

  factory CommentsModel.fromMap(Map<String, dynamic> map) {
    return CommentsModel(
      body: map['body'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentsModel.fromJson(String source) =>
      CommentsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class User {
  String username;
  User({
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
