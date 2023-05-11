import 'package:flutter/material.dart';
import 'package:frontend/constants/my_colors.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  String buttonName;

  MyButton({super.key, required this.onTap, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: darktm,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              color: lighttm2,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
