import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;

  const SingleProduct({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    // var image =
    //     "https://images.unsplash.com/photo-1505968409348-bd000797c92e?auto=format&fit=crop&q=80&w=1471&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1.5),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        child: Container(
          width: 180,
          padding: EdgeInsets.all(10),
          child: Image.network(
            image,
            fit: BoxFit.fitHeight,
            width: 180,
          ),
        ),
      ),
    );
  }
}
