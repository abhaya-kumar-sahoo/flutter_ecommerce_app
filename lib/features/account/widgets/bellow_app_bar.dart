import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BellowAppBar extends StatefulWidget {
  const BellowAppBar({super.key});

  @override
  State<BellowAppBar> createState() => _BellowAppBarState();
}

class _BellowAppBarState extends State<BellowAppBar> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider<UserProvider>.of(context);
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: BoxDecoration(gradient: AppConstants.appBarGradient),
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Row(
        children: [
          RichText(
              text: TextSpan(
                  text: "Hello, ",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                  children: [
                TextSpan(
                  text: user.name,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ])),
        ],
      ),
    );
  }
}
