// To parse this JSON data, do
//
//     final userToken = userTokenFromJson(jsonString);

import 'dart:convert';

UserToken userTokenFromJson(String str) => UserToken.fromJson(json.decode(str));

String userTokenToJson(UserToken data) => json.encode(data.toJson());

class UserToken {
    UserToken({
        required this.token,
        required this.expiration,
        required this.user,
    });

    String token;
    DateTime expiration;
    User user;

    factory UserToken.fromJson(Map<String, dynamic> json) => UserToken(
        token: json["token"],
        expiration: DateTime.parse(json["expiration"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expiration": expiration.toIso8601String(),
        "user": user.toJson(),
    };
}

class User {
    User({
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.role,
        required this.employeeDiscount,
        required this.access,
    });

    String firstName;
    String lastName;
    String username;
    String role;
    int employeeDiscount;
    List<dynamic> access;

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["FirstName"],
        lastName: json["LastName"],
        username: json["Username"],
        role: json["Role"],
        employeeDiscount: json["employeeDiscount"],
        access: List<dynamic>.from(json["access"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "LastName": lastName,
        "Username": username,
        "Role": role,
        "employeeDiscount": employeeDiscount,
        "access": List<dynamic>.from(access.map((x) => x)),
    };
}
