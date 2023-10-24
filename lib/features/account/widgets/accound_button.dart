import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const AccountButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(50),
            color: Colors.white),
        child: OutlinedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black12.withOpacity(0.03),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
            onPressed: onPress,
            child: Text(
              text,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            )),
      ),
    );
  }
}
