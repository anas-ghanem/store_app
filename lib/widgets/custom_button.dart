import 'package:flutter/material.dart';

class custom_button extends StatelessWidget {
  String text;
   custom_button({required this.text,required this.onPressed});
   VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 35,
        child: Text(
         text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
