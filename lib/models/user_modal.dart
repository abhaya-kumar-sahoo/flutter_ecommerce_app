// import 'location.dart';

import 'dart:convert';

class User {
  final String id;
  final String? name;
  final String? password;
  final String? email;
  final String? address;
  final String? type;
  final String? token;
  final List<dynamic> cart;

  // final Location? location;

  User(
      {required this.id,
      required this.name,
      required this.password,
      required this.email,
      required this.address,
      required this.type,
      required this.token,
      required this.cart});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      cart: List<Map<String, dynamic>>.from(
        map['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['_id'],
  //     name: json['name'],
  //     password: json['password'],
  //     address: json['address'],
  //     email: json['email'],
  //     type: json['type'],
  //     token: json['token'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'password': password,
  //     'email': email,
  //     'address': address,
  //     'type': type,
  //     'token': token,
  //   };
  // }
}
