import 'package:assignment_3/constants/gaps.dart';
import 'package:assignment_3/constants/sizes.dart';
import 'package:assignment_3/features/auth/screens/customize_experience_sceen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  late String _email = "";
  late String _name = "";
  DateTime? _birthday;
  DateTime initialDate = DateTime.now();
  bool _showDatePicker = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
    setState(() {
      _showDatePicker = false;
    });
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    setState(() {
      _birthday = date;
    });
  }

  void _onNextTap() {
    if (_name.isEmpty || _email.isEmpty || _birthday == null) {
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomizeExperienceScreen(
            name: _name, email: _email, birthday: _birthday!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            title: FaIcon(FontAwesomeIcons.twitter,
                size: Sizes.size36, color: Theme.of(context).primaryColor),
            leadingWidth: 120,
            leading: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
                    controller: _nameController,
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
                      suffixIcon: _name.isNotEmpty
                          ? Icon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green.shade500,
                              size: Sizes.size20,
                            )
                          : null,
                    ),
                  ),
                  Gaps.v32,
                  TextField(
                    controller: _emailController,
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
                      suffixIcon: _email.isNotEmpty
                          ? Icon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green.shade500,
                              size: Sizes.size20,
                            )
                          : null,
                    ),
                  ),
                  Gaps.v32,
                  TextField(
                    controller: _birthdayController,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        _showDatePicker = true;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Date of birth',
                      hintStyle: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade500,
                      ),
                      suffixIcon: _birthday != null
                          ? Icon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green.shade500,
                              size: Sizes.size20,
                            )
                          : null,
                    ),
                  ),
                ],
              )),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: Sizes.size40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: _onNextTap,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size24,
                      ),
                      decoration: BoxDecoration(
                        color: _name.isNotEmpty &&
                                _email.isNotEmpty &&
                                _birthday != null
                            ? Colors.black
                            : Colors.grey.shade500,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text('Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16 + Sizes.size2,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  if (_showDatePicker)
                    SizedBox(
                      height: 300,
                      child: CupertinoDatePicker(
                        maximumDate: initialDate,
                        initialDateTime: initialDate,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: _setTextFieldDate,
                      ),
                    )
                ],
              ),
            ),
          )),
    );
  }
}
