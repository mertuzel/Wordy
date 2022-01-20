import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String fullName;
  final String email;

  User({
    required this.id,
    required this.fullName,
    required this.email,
  });
//users
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
    };
  }

  Map<String, dynamic> toJsonForMessage() {
    return {
      'fullName': fullName,
      'id': id,
      'email': email,
    };
  }

  User.fromJson(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        fullName = json['fullName'],
        email = json['email'];

  User.fromJsonForMessage(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        email = json['email'];
}
