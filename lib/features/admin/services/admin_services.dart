// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/constants/error_handeling.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/product_modal.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double quantity,
    required double price,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final cloudinary = CloudinaryPublic("dbgznvnav", "txnknctf");
      List<String> imageUrls = [];
      for (var i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path,
              resourceType: CloudinaryResourceType.Image,
              folder: "AMAZON_CLONE"),
        );
        imageUrls.add(response.secureUrl);
        Product product = Product(
            name: name,
            description: description,
            quantity: quantity,
            images: imageUrls,
            category: category,
            price: price);
        http.Response res = await http.post(Uri.parse("$uri/admin/add-product"),
            headers: {
              'Content-Type': 'application/json;charset=UTF-8',
              "x-auth-token": userProvider.token!,
            },
            body: product.toJson());

        httpErrorHandle(
            response: res,
            context: context,
            onSuccess: () {
              showSnackBar(context, "Product Added successfully");
              Navigator.pop(context);
            });
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    ).user;
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/admin/get-products"),
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

  void deleteProduct(
      {required BuildContext context,
      required Product product,
      required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/admin/delete-product"),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          "x-auth-token": userProvider.token!,
        },
        body: jsonEncode({"id": product.id}),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product Deleted successfully");
            onSuccess();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }
}
