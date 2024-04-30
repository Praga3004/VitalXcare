import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final controller;
  final String hinttext;
  final bool obscuretext;
  const Textfield({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.obscuretext,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey.shade400),
        ),
      ),
    );
  }
}