import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/screens/credentials/login_screen.dart';
import 'package:nectar/features/screens/credentials/select_location.dart';
import 'package:nectar/features/widgets/custom_button.dart';
import 'package:nectar/features/widgets/methods/methods.dart';

import '../../const/shared_preferences.dart';
import '../../const/string.dart';
import '../../models/user_info_model.dart';
import 'otp_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _phoneController = TextEditingController();
  String _selectedCountryCode = '+1';
  bool _isSuffixVisibal = false;
  final _formKey = GlobalKey<FormState>();

  void verifyPhoneNumber(String phoneNumber) async {
    try {
      print('$_selectedCountryCode ${_phoneController.text.trim()}');
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '$_selectedCountryCode ${_phoneController.text.trim()}',
        verificationCompleted: (verificationId) async {
          // await FirebaseAuth.instance
          //     .signInWithCredential(verificationId);
        },
        verificationFailed: (FirebaseAuthException firebaseAuthException) {
          print(firebaseAuthException.message);
        },
        codeSent: (String verificationId, int? forceResendToken) async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                verificationId: verificationId,
                phoneNumber:
                    '$_selectedCountryCode ${_phoneController.text.trim()}',
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String autoRetrievalTimeOut) {},
      );
    } catch (e) {
      print('Error:==========>  ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/sign_in.png'),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      StringConst.signInTitle,
                      style: TextStyle(
                        color: ColorConst.titleTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 2,
                          color: Colors.grey.withOpacity(0.5),
                        )),
                      ),
                      child: Row(
                        children: [
                          _isSuffixVisibal
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: CountryCodePicker(
                                    initialSelection: _selectedCountryCode,
                                    onChanged: (CountryCode countryCode) {
                                      setState(() {
                                        _selectedCountryCode =
                                            countryCode.dialCode!;
                                      });
                                    },
                                    flagDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    // Other customizations for CountryCodePicker
                                  ),
                                )
                              : CountryCodePicker(
                                  initialSelection: _selectedCountryCode,
                                  onChanged: (CountryCode countryCode) {
                                    setState(() {
                                      _selectedCountryCode =
                                          countryCode.dialCode!;
                                      print(
                                          'Country code is =========>: $_selectedCountryCode');
                                    });
                                  },
                                  flagDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  // Other customizations for CountryCodePicker
                                ),
                          Expanded(
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.phone,
                              maxLength: 12,
                              onChanged: (value) {
                                print(value.length);
                                if (value.length >= 10) {
                                  _isSuffixVisibal = true;
                                } else {
                                  _isSuffixVisibal = false;
                                }
                                setState(() {});
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone number can not Empty';
                                } else if (value.length < 10) {
                                  return 'Phone number length is small';
                                }
                              },
                              controller: _phoneController,
                              decoration: InputDecoration(
                                // hintText: 'Enter phone number',
                                // Display the selected code
                                border: InputBorder.none,
                                errorBorder: const UnderlineInputBorder(),
                                counterText: "",
                                suffixIcon: _isSuffixVisibal
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: FloatingActionButton(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          )),
                                          backgroundColor:
                                              ColorConst.primaryColor,
                                          onPressed: () {
                                            verifyPhoneNumber(
                                                '$_selectedCountryCode ${_phoneController.text.trim()}');
                                          },
                                          child: const Icon(
                                            Icons.navigate_next,
                                            color: ColorConst.lightWhite,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // CustomButton(
                    //     title: StringConst.sendOtp,
                    //     color: ColorConst.googleBtnColor,
                    //     onTap: () async {
                    //       verifyPhoneNumber(
                    //           '$_selectedCountryCode ${_phoneController.text.trim()}');
                    //     }),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          icon: const Icon(
                            Icons.email_outlined,
                            color: ColorConst.lightWhite,
                            size: 24,
                          ),
                          title: 'Sign in with email',
                          color: ColorConst.primaryColor,
                          onTap: () async {
                            // perform the fire base phone authentication
                            nextScreen(
                                context: context,
                                nextScreen: const LoginScreen());
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(StringConst.otherOptions),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          icon: Image.asset(
                            'assets/icons/google.png',
                            height: 24,
                            width: 24,
                          ),
                          title: StringConst.googleLogin,
                          color: ColorConst.googleBtnColor,
                          onTap: () {
                            signInWithGoogle().then((value) async {
                              print(value);
                              await SharedPreferencesHelper.setUserUid(
                                  value.user!.uid);

                              CollectionReference userDataReference =
                                  FirebaseFirestore.instance
                                      .collection('userData');

                              await userDataReference
                                  .doc(value.user!.uid)
                                  .set(UserInfoModel(
                                    uid: value.user!.uid,
                                    name: value.user!.displayName.toString(),
                                    email: value.user!.email.toString(),
                                    phoneNumber:
                                        value.user!.phoneNumber.toString(),
                                  ).toJson())
                                  .then((value) {
                                nextScreenReplace(
                                    context: context,
                                    nextScreen: const SelectLocation());
                              });
                              print("Ok google...");
                            }).onError((error, stackTrace) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(error.toString())));
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          icon: Image.asset(
                            'assets/icons/facebook.png',
                            height: 24,
                            width: 24,
                          ),
                          title: StringConst.facebookLogin,
                          color: ColorConst.facebookBtnColor,
                          onTap: () {}),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Google error: $e');

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));

      throw Exception(e);
    }
  }
}

// class SignInScreen extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   Future<User?> _signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount!.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//
//       final UserCredential authResult = await _auth.signInWithCredential(credential);
//       final User? user = authResult.user;
//
//       return user;
//     } catch (error) {
//       print(error);
//       return null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             User? user = await _signInWithGoogle();
//             if (user != null) {
//               // Navigate to the next screen or perform other actions
//               print('Signed in: ${user.displayName}');
//             } else {
//               print('Sign in failed');
//             }
//           },
//           child: Text('Sign in with Google'),
//         ),
//       ),
//     );
//   }
// }
