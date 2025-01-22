import 'package:assignment_3/constants/gaps.dart';
import 'package:assignment_3/constants/sizes.dart';
import 'package:assignment_3/features/auth/screens/create_account_screen.dart';
import 'package:assignment_3/features/auth/widgets/button.dart';
import 'package:assignment_3/features/auth/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  void _handleNavigateCreateAccount(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CreateAccountScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FaIcon(FontAwesomeIcons.twitter,
              size: Sizes.size36, color: Theme.of(context).primaryColor),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v80,
              Text(
                'See what\'s happening in the world right now',
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v80,
              SocialAuthButton(
                  text: 'Continue with Google',
                  icon: FaIcon(FontAwesomeIcons.google, size: Sizes.size20)),
              Gaps.v16,
              SocialAuthButton(
                  text: 'Continue with Apple',
                  icon: FaIcon(FontAwesomeIcons.apple, size: Sizes.size20)),
              Gaps.v16,
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: Sizes.size1,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size16),
                          child: Text(
                            'or',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          )))
                ],
              ),
              Gaps.v12,
              Button(
                  text: 'Create account',
                  onTap: () => _handleNavigateCreateAccount(context)),
              Gaps.v20,
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 0,
                children: [
                  Text('By signing up, you agree to our ',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade700,
                      )),
                  Text('Terms',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                      )),
                  Text(',',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade700,
                      )),
                  Text('Privacy Policy',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                      )),
                  Text(' and ',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade700,
                      )),
                  Text('Cookie Use',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                      )),
                  Text('.',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade700,
                      )),
                ],
              ),
              Gaps.v52,
              Row(
                children: [
                  Text('Have an account a already? ',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade700,
                      )),
                  Text('Log in',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                      )),
                ],
              )
            ],
          ),
        )));
  }
}
