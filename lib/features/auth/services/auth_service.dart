import 'package:amazon/common/widgets/bottom_bar.dart';
import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/constants/error_handeling.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/user_modal.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: "",
          name: name,
          password: password,
          address: "address",
          email: email,
          cart: [],
          type: "type",
          token: "token");
      print(user.toJson());

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          "Access-Control-Allow-Origin": "*",
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, "Success");
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("x-auth-token", jsonDecode(res.body)["token"]);
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          });
      print("FHHC" + res.body);
    } catch (e) {
      showSnackBar(context, "Something went wrong");
      print("jhjvjv $e");
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: "",
          name: "",
          password: password,
          address: "address",
          email: email,
          cart: [],
          type: "type",
          token: "token");

      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          "Access-Control-Allow-Origin": "*",
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, "Success");
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("x-auth-token", jsonDecode(res.body)["token"]);
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          });
      print("FHHC" + res.body);
    } catch (e) {
      showSnackBar(context, "Something went wrong");
      print("jhjvjv $e");
    }
  }

//get user data
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");
      if (token == null) {
        prefs.setString("x-auth-token", "");
      }
      print(token);
      var tokenRes = await http.post(
        Uri.parse("$uri/tokenIsValid"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          "x-auth-token": token!,
        },
      );
      print("abhaya  $tokenRes");
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response res = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            "x-auth-token": token,
          },
        );
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(res.body);
      }
    } catch (e) {
      // showSnackBar(context, "Something went wrong");
      print("jhjvjv $e");
    }
  }
}
