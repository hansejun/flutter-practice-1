import 'package:assignment_3/constants/sizes.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final bool isDisabled;
  const Button(
      {super.key,
      required this.text,
      required this.onTap,
      this.color,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        height: Sizes.size56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? Colors.grey.shade900,
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
