import 'package:flutter/material.dart';

class custom_textfild extends StatelessWidget {
  String? hinttext;
  Function(String)? onChanged;
  custom_textfild({required this.hinttext, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinttext,
        
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
