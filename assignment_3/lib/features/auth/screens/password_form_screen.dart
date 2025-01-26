import 'package:assignment_3/constants/gaps.dart';
import 'package:assignment_3/constants/sizes.dart';
import 'package:assignment_3/features/auth/screens/interesets.screen.dart';
import 'package:assignment_3/features/auth/screens/verify_email_screen.dart';
import 'package:assignment_3/features/auth/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordFormScreen extends StatefulWidget {
  const PasswordFormScreen({
    super.key,
  });

  @override
  State<PasswordFormScreen> createState() => _PasswordFormScreenState();
}

class _PasswordFormScreenState extends State<PasswordFormScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _obscureText = true;
  void _onNextStep() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VerifyEmailScreen()));
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
              Text('You\'ll need a password',
                  style: TextStyle(
                      fontSize: Sizes.size28, fontWeight: FontWeight.w900)),
              Gaps.v40,
              TextField(
                controller: _passwordController,
                onEditingComplete: _onSubmit,
                obscureText: _obscureText,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.grey.shade800,
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      _isPasswordValid()
                          ? Icon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green.shade500,
                              size: Sizes.size20,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  hintText: "Make it strong!",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
            ],
          )),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Button(
            text: 'Next',
            color: _isPasswordValid() ? Colors.black : Colors.grey.shade400,
            onTap: _onNextStep),
      )),
    );
  }
}
