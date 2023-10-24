import 'package:amazon/features/account/widgets/accound_button.dart';
import 'package:amazon/features/account/widgets/orders.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Your order", onPress: () {}),
            AccountButton(text: "Turn seller", onPress: () {})
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(text: "Logout", onPress: () {}),
            AccountButton(text: "Your wishlist", onPress: () {})
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Orders()
      ],
    );
  }
}
