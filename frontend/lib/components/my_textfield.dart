import 'package:flutter/material.dart';
import 'package:frontend/constants/my_colors.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: darktm, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: darktm,
            ),
          ),
          fillColor: lighttm2,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
