import 'package:assignment_3/constants/gaps.dart';
import 'package:assignment_3/constants/sizes.dart';
import 'package:assignment_3/features/auth/screens/verify_email_screen.dart';
import 'package:assignment_3/features/auth/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  final String name;
  final String email;
  final DateTime birthday;
  const SignUpScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.birthday});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void _onNextStep() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VerifyEmailScreen(email: widget.email)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: FaIcon(FontAwesomeIcons.twitter,
            size: Sizes.size36, color: Theme.of(context).primaryColor),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text('Create your account',
                  style: TextStyle(
                      fontSize: Sizes.size28, fontWeight: FontWeight.w900)),
              Gaps.v40,
              TextField(
                enabled: false,
                controller: TextEditingController(text: widget.name),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Sizes.size16,
                ),
                decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.grey.shade500,
                    ),
                    suffixIcon: Icon(
                      FontAwesomeIcons.solidCircleCheck,
                      color: Colors.green.shade500,
                      size: Sizes.size20,
                    )),
              ),
              Gaps.v32,
              TextField(
                enabled: false,
                controller: TextEditingController(text: widget.email),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Sizes.size16,
                ),
                decoration: InputDecoration(
                    hintText: 'Phone number or email address',
                    hintStyle: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.grey.shade500,
                    ),
                    suffixIcon: Icon(
                      FontAwesomeIcons.solidCircleCheck,
                      color: Colors.green.shade500,
                      size: Sizes.size20,
                    )),
              ),
              Gaps.v32,
              TextField(
                enabled: false,
                controller: TextEditingController(
                    text: widget.birthday.toString().split(" ").first),
                decoration: InputDecoration(
                    hintText: 'Date of birth',
                    hintStyle: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.grey.shade500,
                    ),
                    suffixIcon: Icon(
                      FontAwesomeIcons.solidCircleCheck,
                      color: Colors.green.shade500,
                      size: Sizes.size20,
                    )),
              ),
            ],
          )),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Button(
            text: 'Sign up',
            color: Theme.of(context).primaryColor,
            onTap: _onNextStep),
      )),
    );
  }
}
