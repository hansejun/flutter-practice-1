import 'package:assignment_3/constants/gaps.dart';
import 'package:assignment_3/constants/sizes.dart';
import 'package:assignment_3/features/auth/screens/password_form_screen.dart';
import 'package:assignment_3/features/auth/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  const VerifyEmailScreen({
    super.key,
    this.email = 'qwer@naver.com',
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  bool _isCodeComplete() {
    return _controllers.every((controller) => controller.text.length == 1);
  }

  void _onChangeField(String value, int index) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).nextFocus();
    }
    setState(() {});
  }

  void _onTapNext() {
    if (_isCodeComplete()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PasswordFormScreen()));
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
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
              Text('We sent you an code',
                  style: TextStyle(
                      fontSize: Sizes.size28, fontWeight: FontWeight.w900)),
              Gaps.v40,
              Text('Enter it below to verify',
                  style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700)),
              Text(widget.email,
                  style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700)),
              Gaps.v60,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 6; i++)
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _controllers[i],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          counterText: "",
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        onChanged: (value) => _onChangeField(value, i),
                      ),
                    ),
                ],
              ),
              Gaps.v32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.green.shade500
                        .withValues(alpha: _isCodeComplete() ? 1 : 0),
                    size: Sizes.size32,
                  )
                ],
              )
            ],
          )),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Button(
            text: 'Next',
            color: _isCodeComplete()
                ? Theme.of(context).primaryColor
                : Colors.grey.shade400,
            onTap: () {
              _onTapNext();
            }),
      )),
    );
  }
}
