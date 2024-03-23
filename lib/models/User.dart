// ignore_for_file: file_names

import 'dart:convert';

class AUser {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  String
      password; // Consider using a secure storage solution instead of storing passwords directly
  String? profilePictureUrl;
  Map<dynamic, dynamic>? deviceInfo;
  String? userToken;

  AUser(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.password,
      required this.profilePictureUrl,
      this.deviceInfo,
      this.userToken});

  factory AUser.fromJson(Map<dynamic, dynamic> json) {
    return AUser(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      deviceInfo: json['deviceInfo'],
      userToken: json['userToken'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'userToken': userToken,
      'profilePictureUrl': profilePictureUrl,
      'deviceInfo': deviceInfo
    };
  }

  // Optional: Method to parse JSON string directly
  factory AUser.fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return AUser.fromJson(jsonMap);
  }

  // Optional: Method to convert to JSON string directly
  String toJsonString() {
    return json.encode(toJson());
  }
}
