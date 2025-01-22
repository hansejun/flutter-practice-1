import 'package:assignment_3/constants/gaps.dart';
import 'package:assignment_3/constants/sizes.dart';
import 'package:assignment_3/features/auth/screens/sign_up_screen.dart';
import 'package:assignment_3/features/auth/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  final String name;
  final String email;
  final DateTime birthday;
  const CustomizeExperienceScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.birthday});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isTrack = false;

  void _onToggleSwitch(bool value) {
    setState(() {
      _isTrack = value;
    });
  }

  void _onNextStep() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpScreen(
            name: widget.name, email: widget.email, birthday: widget.birthday),
      ),
    );
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
            Text('Customize your experience',
                style: TextStyle(
                    fontSize: Sizes.size28, fontWeight: FontWeight.w900)),
            Gaps.v40,
            Text('Track where you see Twitter content across the web',
                style: TextStyle(
                    letterSpacing: -0.5,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w900)),
            Gaps.v32,
            Row(
              children: [
                Expanded(
                  child: Text(
                      'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email,or phone number',
                      style: TextStyle(
                          letterSpacing: -0.5,
                          fontSize: Sizes.size16 + 2,
                          fontWeight: FontWeight.w600)),
                ),
                Gaps.h6,
                Switch(
                    value: _isTrack,
                    onChanged: _onToggleSwitch,
                    activeTrackColor: Colors.green,
                    inactiveTrackColor: Colors.white,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.black),
              ],
            ),
            Gaps.v40,
            Wrap(
              children: [
                Text('By signing up, you agree to our ',
                    style: TextStyle(
                        fontSize: Sizes.size16, color: Colors.grey.shade700)),
                Text('Terms',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor)),
                Text(', ',
                    style: TextStyle(
                        fontSize: Sizes.size16, color: Colors.grey.shade700)),
                Text('Privacy Policy',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor)),
                Text(' and ',
                    style: TextStyle(
                        fontSize: Sizes.size16, color: Colors.grey.shade700)),
                Text('Cookie Use',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor)),
                Text('.', style: TextStyle(fontWeight: FontWeight.w600)),
                Gaps.h6,
                Text(
                    'Twitter may use your data to improve its tailored experiences',
                    style: TextStyle(
                        fontSize: Sizes.size16, color: Colors.grey.shade700)),
                Gaps.h6,
                Text('Learn more',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor)),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Button(
            text: 'Next',
            onTap: _onNextStep,
            color: _isTrack ? null : Colors.grey.shade400,
            isDisabled: !_isTrack),
      )),
    );
  }
}
