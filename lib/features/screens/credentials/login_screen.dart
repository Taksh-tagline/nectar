import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/shared_preferences.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/const/text_style.dart';
import 'package:nectar/features/screens/credentials/sign_up_screen.dart';
import 'package:nectar/features/widgets/custom_textfield.dart';
import 'package:nectar/features/widgets/methods/methods.dart';

import '../../widgets/custom_button.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final _forgetRecognizer;
  late final _doNotHaveAccountRecognizer;
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _forgetRecognizer = TapGestureRecognizer()..onTap = _handleForgotPassword;
    _doNotHaveAccountRecognizer = TapGestureRecognizer()
      ..onTap = _handleDoNotHaveAccount;
  }

  void _handleForgotPassword() {
    print("Handle forgot password ");
    HapticFeedback.vibrate();
  }

  void _handleDoNotHaveAccount() {
    print("do not have account clicked ");
    HapticFeedback.vibrate();
    nextScreenReplace(context: context, nextScreen: const SignUpScreen());
  }

  String giveSubCollectionName(String productCategory) {
    switch (productCategory) {
      case StringConst.vegetableCategory:
        return '${StringConst.vegetableCategory}Data';
      case StringConst.oilCategory:
        return '${StringConst.oilCategory}Data';
      case StringConst.meatCategory:
        return '${StringConst.meatCategory}Data';
      case StringConst.bakeryCategory:
        return '${StringConst.bakeryCategory}Data';
      case StringConst.dairyCategory:
        return '${StringConst.dairyCategory}Data';
      case StringConst.beveragesCategory:
        return '${StringConst.beveragesCategory}Data';
      case StringConst.snacksCategory:
        return '${StringConst.snacksCategory}Data';
      case StringConst.soapsCategory:
        return '${StringConst.soapsCategory}Data';
      default:
        return '';
    }
  }

  String giveCollectionDocumentId(String productCategory) {
    switch (productCategory) {
      case StringConst.vegetableCategory:
        return 'yDOQfx4tdzC8yNQOlHRe';
      case StringConst.oilCategory:
        return 'vmxBnyDHXOoBXE2s5m2I';
      case StringConst.meatCategory:
        return 'sxuZ5dhB5UAnRNKEyXpV';
      case StringConst.bakeryCategory:
        return 'R8rKkFhDvKMaR1a2wcQ6';
      case StringConst.dairyCategory:
        return 'CGnVsMaYyK7GOT6yElVg';
      case StringConst.beveragesCategory:
        return 'JRMqfTn0IFs7wpsf6PHs';
      case StringConst.snacksCategory:
        return 'WbXZMzdAbYy3BXuHzLEj';
      case StringConst.soapsCategory:
        return 'ZPffJhqin0ogGpoO2IRv';
      default:
        return '';
    }
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
                        StringConst.login,
                        style: CustomTextStyle.titleTextStyle,
                      ),
                      Text(
                        StringConst.emailAndPassword,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: ColorConst.kDefaultPadding,
                      ),
                      CustomTextFiled(
                        textInputType: TextInputType.emailAddress,
                        controller: _emailController,
                        labelText: StringConst.email,
                        contentPadding: 5,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: StringConst.forgotPassword,
                              style: const TextStyle(
                                color: ColorConst.titleTextColor,
                                fontWeight: FontWeight.w600,
                                decorationStyle: TextDecorationStyle.wavy,
                              ),
                              recognizer: _forgetRecognizer,
                            )
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: ColorConst.kDefaultPadding * 1.5,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                            title: StringConst.login,
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
                                      .signInWithEmailAndPassword(
                                    email: _emailController.text.toString(),
                                    password:
                                        _passwordController.text.toString(),
                                  )
                                      .then((value) async {
                                    await SharedPreferencesHelper
                                        .setUserLoggedInStatus(true);
                                    var uid = _auth.currentUser!.uid;

                                    DocumentSnapshot userDataSnapshot =
                                        await FirebaseFirestore.instance
                                            .collection('userData')
                                            .doc(uid)
                                            .get();

                                    Map<String, dynamic> userData =
                                        userDataSnapshot.data()
                                            as Map<String, dynamic>;

                                    var userBox =
                                        await Hive.openBox('userData');

                                    userBox.put('user', {
                                      'name': userData['name'],
                                      'email': userData['email'],
                                      'password': userData['password'],
                                      'uid': userData['uid'],
                                      'address': userData['address'],
                                      'city': userData['city'],
                                      'state': userData['state'],
                                      'userProfileImage':
                                          userData['userProfileImage']
                                    }).then((value) {
                                      print(
                                          'Data Store Success Using Login ... ');
                                    });

                                    // fetch the favourite from the firebas

                                    var favouriteBox = await Hive.openBox(
                                        StringConst.favouriteHive);

                                    FirebaseFirestore.instance
                                        .collection(
                                            StringConst.userDataCollection)
                                        .doc(uid)
                                        .collection(
                                            StringConst.favouritesCollection)
                                        .get()
                                        .then((value) {
                                      value.docs.forEach((element) {
                                        String productId =
                                            element.data()['productId'];
                                        String category =
                                            element.data()['category'];

                                        print(
                                            giveCollectionDocumentId(category));
                                        print(giveSubCollectionName(category));

                                        FirebaseFirestore.instance
                                            .collection(
                                                StringConst.exploreCollection)
                                            .doc(StringConst.exploreCategoryId)
                                            .collection(category)
                                            .doc(giveCollectionDocumentId(
                                                category))
                                            .collection(
                                                giveSubCollectionName(category))
                                            .get()
                                            .then((value) {
                                          value.docs.forEach((element) async {
                                            var favouriteBox =
                                                await Hive.openBox(
                                                    StringConst.favouriteHive);

                                            if (element.data()['productId'] ==
                                                productId) {
                                              favouriteBox.put(
                                                element.data()['productId'],
                                                {
                                                  'title':
                                                      element.data()['title'],
                                                  'subtitle': element
                                                      .data()['subtitle'],
                                                  'image':
                                                      element.data()['image'],
                                                  'price':
                                                      element.data()['price'],
                                                  'productDetails': element
                                                      .data()['productDetails'],
                                                  'calories': element
                                                          .data()['nutrition']
                                                      ['calories'],
                                                  'vitamin': element
                                                          .data()['nutrition']
                                                      ['vitamin'],
                                                  'fibar': element
                                                          .data()['nutrition']
                                                      ['fibar'],
                                                  'quantity': element
                                                      .data()['quantity'],
                                                  'isFavourite': element
                                                      .data()['isFavourite'],
                                                  'review':
                                                      element.data()['review'],
                                                  'isAlreadyInBasket':
                                                      element.data()[
                                                          'isAlreadyInBasket'],
                                                  'productId': element
                                                      .data()['productId'],
                                                  'category': element
                                                      .data()['productId'],
                                                },
                                              ).then((value) {
                                                print(
                                                    "success to update Hive box");
                                              });
                                            }
                                          });
                                        });
                                      });
                                    });

                                    //
                                    // String city = '';
                                    // String state = '';
                                    // var userData = FirebaseFirestore.instance
                                    //     .collection('userData')
                                    //     .get()
                                    //     .then((snashot) async {
                                    //
                                    //   var data = snashot.docs.toList();
                                    //   var userData = data[0];
                                    //   print(
                                    //       'Getted data is ========> : ${userData['name']}');
                                    //
                                    //   String address = userData['address'];
                                    //   city = address.split(',').elementAt(1);
                                    //   state = address.split(',').elementAt(2);
                                    //
                                    //   var box = await Hive.openBox('userData');
                                    //
                                    //   box.put('user', {
                                    //     'name': userData['name'],
                                    //     'email': userData['email'],
                                    //     'password': userData['password'],
                                    //     'address': userData['address'],
                                    //     'city': userData['city'],
                                    //     'state': userData['state'],
                                    //     'uid': userData['uid'],
                                    //   }).then((value) {
                                    //     print(
                                    //         "Success to fetch the user data and store inside the hive ");
                                    //   });
                                    // });

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()),
                                        (route) => false);
                                  });
                                } on FirebaseAuthException catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(e.message.toString())));
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
                          TextSpan(children: [
                            const TextSpan(
                              text: StringConst.doNotHaveAccount,
                              style: TextStyle(
                                color: ColorConst.titleTextColor,
                                fontWeight: FontWeight.w600,
                                decorationStyle: TextDecorationStyle.wavy,
                              ),
                            ),
                            TextSpan(
                              text: StringConst.signup,
                              style: const TextStyle(
                                color: ColorConst.primaryColor,
                                fontWeight: FontWeight.w600,
                                decorationStyle: TextDecorationStyle.wavy,
                              ),
                              recognizer: _doNotHaveAccountRecognizer,
                            ),
                          ]),
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
