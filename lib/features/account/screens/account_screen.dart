import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/features/account/widgets/bellow_app_bar.dart';
import 'package:amazon/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: AppConstants.appBarGradient),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/amazon_in.png',
                      width: 120,
                      height: 45,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    child: const Row(children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.notifications_outlined),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.search),
                      )
                    ]),
                  )
                ]),
          )),
      body: Column(children: [
        BellowAppBar(),
        SizedBox(
          height: 10,
        ),
        TopButton()
      ]),
    );
  }
}
