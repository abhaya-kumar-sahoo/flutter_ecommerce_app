import 'dart:convert';

import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/constants/error_handeling.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/product_modal.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';

class SearchServices {
  Future<List<Product>> fetchSearchProduct(
      {required BuildContext context, required String searchQuery}) async {
    List<Product> productList = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    print(
      "searchQuery $searchQuery",
    );
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/products/search/$searchQuery"),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          "x-auth-token": userProvider.token!,
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (var i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                Product.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)[i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return productList;
  }
}
