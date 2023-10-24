import 'package:amazon/models/user_modal.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      address: "",
      email: "",
      name: "",
      password: "",
      cart: [],
      token: "",
      type: "");

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
