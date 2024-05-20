import 'dart:convert';

class UserModel {
  final int id;
  final String username;
  final String email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  final String token;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    required this.token,
  });

  factory UserModel.fromjson(Map<String, dynamic> data) => UserModel(
        id: data['id'] as int,
        username: data['username'] as String,
        email: data['email'] as String,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        gender: data['gender'] as String?,
        image: data['image'] as String?,
        token: data['token'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'username': username,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'image': image,
        'token': token,
      };

  String toJson() => json.encode(toMap());
}
