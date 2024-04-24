import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:nectar/features/const/shared_preferences.dart';
import 'package:nectar/features/models/user_info_model.dart';
import 'package:nectar/features/screens/credentials/login_screen.dart';
import 'package:nectar/features/screens/credentials/select_location.dart';
import 'package:nectar/features/widgets/methods/methods.dart';

import '../../const/color.dart';
import '../../const/string.dart';
import '../../const/text_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();
  late final _termsAndServiceRecognizer;
  late final _alreadyHaveAccountRecognizer;
  bool _isPasswordVisible = false;
  bool _isEmailSuffixVisible = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _termsAndServiceRecognizer = TapGestureRecognizer()
      ..onTap = _handleTermsAndServiceRecognizer;
    _alreadyHaveAccountRecognizer = TapGestureRecognizer()
      ..onTap = _handleAlreadyHaveAccountRecognizer;
  }

  void _handleTermsAndServiceRecognizer() {
    print("Terms clicked..");
    HapticFeedback.heavyImpact();
  }

  void _handleAlreadyHaveAccountRecognizer() {
    print(" Already have account clicked..");
    HapticFeedback.vibrate();
    nextScreenReplace(context: context, nextScreen: const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  _isLoading
                      ? Positioned(
                          top: MediaQuery.of(context).size.height * 0.5 - 18,
                          right: MediaQuery.of(context).size.width * 0.5 - 18,
                          child: const SizedBox(
                            height: 36,
                            width: 36,
                            child: CircularProgressIndicator(
                              color: ColorConst.primaryColor,
                            ),
                          ),
                        )
                      : Container(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Center(
                            child: Image.asset('assets/icons/carrots_red.png')),
                      ),
                      const Text(
                        StringConst.signup,
                        style: CustomTextStyle.titleTextStyle,
                      ),
                      Text(
                        StringConst.enterCredential,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: ColorConst.kDefaultPadding,
                      ),
                      CustomTextFiled(
                        inputFormatter: [
                          FilteringTextInputFormatter.deny('  ')
                        ],
                        textInputType: TextInputType.text,
                        controller: _userNameController,
                        labelText: StringConst.userName,
                        contentPadding: 5,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email can not be Empty..';
                          } else if (value.length < 3) {
                            return 'Check the length';
                          }
                        },
                      ),
                      const SizedBox(
                        height: ColorConst.kDefaultPadding,
                      ),
                      CustomTextFiled(
                        textInputType: TextInputType.emailAddress,
                        controller: _emailController,
                        labelText: StringConst.email,
                        suffixIcon: _isEmailSuffixVisible
                            ? const IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.done,
                                  color: ColorConst.primaryColor,
                                ))
                            : null,
                        contentPadding: 5,
                        onChange: (value) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);

                          if (emailValid) {
                            setState(() {
                              _isEmailSuffixVisible = true;
                            });
                          }
                        },
                        validator: (value) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_emailController.text.toString());

                          if (value!.isEmpty) {
                            return 'Email can not be Empty..';
                          } else if (!emailValid) {
                            return 'Enter valid email';
                          }
                        },
                      ),
                      const SizedBox(
                        height: ColorConst.kDefaultPadding,
                      ),
                      CustomTextFiled(
                        inputFormatter: [FilteringTextInputFormatter.deny(' ')],
                        textInputType: TextInputType.emailAddress,
                        controller: _passwordController,
                        obscureText: _isPasswordVisible ? false : true,
                        labelText: StringConst.password,
                        contentPadding: 5,
                        suffixIcon: IconButton(
                          onPressed: () {
                            print('Tapped..');
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          icon: _isPasswordVisible
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined),
                        ),
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return 'Password can not be empty';
                          } else if (value.length < 8) {
                            return 'Check the Length of Password';
                          }
                          if (!regex.hasMatch(value)) {
                            return 'password must contain [Uppercase,Lowercase,digit,special character]';
                          }
                        },
                      ),
                      const SizedBox(
                        height: ColorConst.kDefaultPadding / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text.rich(
                            TextSpan(children: [
                              const TextSpan(
                                text: StringConst.termsAndConditions,
                                style: TextStyle(
                                  color: ColorConst.titleTextColor,
                                  fontSize: 14,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                              ),
                              TextSpan(
                                text: ' Terms of Service',
                                style: const TextStyle(
                                  color: ColorConst.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                                recognizer: _termsAndServiceRecognizer,
                              ),
                              const TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  color: ColorConst.titleTextColor,
                                  fontSize: 14,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                              ),
                              TextSpan(
                                text: 'Private Policy.',
                                style: const TextStyle(
                                  color: ColorConst.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                                recognizer: _termsAndServiceRecognizer,
                              ),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: ColorConst.kDefaultPadding * 1.5,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                            title: StringConst.signup,
                            color: ColorConst.primaryColor,
                            onTap: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              if (_formKey.currentState!.validate()) {
                                print(
                                    'Every thing is fine we are good to go o next screen ....');

                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: _emailController.text.toString(),
                                    password:
                                        _passwordController.text.toString(),
                                  )
                                      .then((value) async {
                                    await SharedPreferencesHelper.setUserUid(
                                        value.user!.uid);
                                    await SharedPreferencesHelper
                                        .setUserLoggedInStatus(true);

                                    await SharedPreferencesHelper.setUserName(
                                        _userNameController.text
                                            .toString()
                                            .trim());
                                    await SharedPreferencesHelper.setUserEmail(
                                        _emailController.text
                                            .toString()
                                            .trim());
                                    await SharedPreferencesHelper
                                        .setUserPassword(_passwordController
                                            .text
                                            .toString()
                                            .trim());
                                    //
                                    var box = await Hive.openBox('userData');

                                    box.put('user', {
                                      'name':
                                          _userNameController.text.toString(),
                                      'email': _emailController.text.toString(),
                                      'password':
                                          _passwordController.text.toString(),
                                      'uid': value.user!.uid,
                                      'imageLink':
                                          'https://firebasestorage.googleapis.com/v0/b/nectar-bbe2b.appspot.com/o/assets%2Fimages%2Fuser%2Fuser.jpeg?alt=media&token=10446d77-2a32-4e7a-b421-e1f4c42d0441',
                                    }).then((value) {
                                      print(" Added data");
                                    });

                                    // store the use data inside firebase
                                    CollectionReference userDataReference =
                                        FirebaseFirestore.instance
                                            .collection('userData');

                                    userDataReference
                                        .doc(value.user!.uid)
                                        .set(UserInfoModel(
                                          uid: value.user!.uid,
                                          name: _userNameController.text
                                              .toString(),
                                          email:
                                              _emailController.text.toString(),
                                          password: _passwordController.text
                                              .toString(),
                                        ).toJson());

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SelectLocation()),
                                        (route) => false);
                                  });
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('User Already present')));
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.toString())));
                                }
                              }
                              setState(() {
                                _isLoading = false;
                              });
                            }),
                      ),
                      const SizedBox(
                        height: ColorConst.kDefaultPadding,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: StringConst.alreadyHaveAccount,
                                style: TextStyle(
                                  color: ColorConst.titleTextColor,
                                  fontWeight: FontWeight.w600,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                              ),
                              TextSpan(
                                text: StringConst.login,
                                style: const TextStyle(
                                  color: ColorConst.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                                recognizer: _alreadyHaveAccountRecognizer,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
