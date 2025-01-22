import 'package:assignment_3/constants/gaps.dart';
import 'package:assignment_3/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialAuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  const SocialAuthButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Gaps.h16,
            Text(text,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w900,
                )),
          ],
        ),
      ),
    );
  }
}
