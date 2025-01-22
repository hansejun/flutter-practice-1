import 'package:assignment_3/constants/sizes.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Button({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: Sizes.size56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w800,
            )),
      ),
    );
  }
}
