import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/const/text_style.dart';
import 'package:nectar/features/screens/credentials/select_location.dart';

import '../../const/shared_preferences.dart';
import '../../models/user_info_model.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {Key? key, required this.phoneNumber, required this.verificationId})
      : super(key: key);

  final String verificationId;
  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  Timer? _resendTimer;
  int _secondsRemaining = 60;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _resendTimer?.cancel();
  }

  void _startTimer() {
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _resendTimer?.cancel();
      }
    });
  }

  void _verifyOtp() async {
    final otp = _otpController.text.trim();

    try {
      // final PhoneAuthCredential credential = PhoneAuthProvider();
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        await SharedPreferencesHelper.setUserUid(value.user!.uid);

        // add user data to firebase
        CollectionReference userDataReference =
            FirebaseFirestore.instance.collection('userData');

        userDataReference.doc(value.user!.uid).set(UserInfoModel(
              uid: value.user!.uid,
              phoneNumber: widget.phoneNumber,
            ).toJson());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SelectLocation()));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void _resendOtp() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: (credential) async {
          // Automatic verification (not used for this flow)
        },
        verificationFailed: (exception) {
          // Handle errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(exception.message!),
            ),
          );
        },
        codeSent: (verificationId, forceResendingToken) {
          // OTP resent successfully, update state
          setState(() {
            _secondsRemaining = 60;
          });
          _startTimer();
        },
        codeAutoRetrievalTimeout: (verificationId) {
          // Handle timeout
        },
        forceResendingToken: null,
      );
    } catch (error) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    }
  }

  // Row(
  // mainAxisAlignment: MainAxisAlignment.center,
  // children: [
  // Text('Resend OTP in $_secondsRemaining seconds'),
  // ElevatedButton(
  // onPressed: _secondsRemaining == 0 ? _resendOtp : null,
  // child: const Text('Resend'),
  // ),
  // ],
  // ),
  // ElevatedButton(
  // onPressed: () {
  // // check the validation of user entered code and firebase send
  // _verifyOtp();
  // },
  // child: const Text("Verify")),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringConst.otpTitle,
                style: CustomTextStyle.titleTextStyle,
              ),
              const SizedBox(
                height: ColorConst.kDefaultPadding,
              ),
              const Text(
                StringConst.code,
              ),
              const SizedBox(
                height: ColorConst.kDefaultPadding / 2,
              ),
              // Column(
              //   children: [
              //     OtpTextField(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       numberOfFields: 6,
              //       borderColor: ColorConst.lightWhite,
              //       focusedBorderColor: ColorConst.primaryColor,
              //       borderWidth: 2.0,
              //       fieldWidth: 10,
              //       decoration: InputDecoration(border: UnderlineInputBorder()),
              //       hasCustomInputDecoration: true,
              //       //runs when a code is typed in
              //       onCodeChanged: (String code) {
              //         //handle validation or checks here if necessary
              //       },
              //       //runs when every textfield is filled
              //       onSubmit: (String verificationCode) {},
              //     ),
              //     Divider(),
              //   ],
              // ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Otp field is Empty!!';
                  } else if (value.length != 6) {
                    return 'Invalid otp';
                  }
                },
                controller: _otpController,
                decoration: const InputDecoration(
                  hintText: '------',
                  errorBorder: UnderlineInputBorder(),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'OTP expire in $_secondsRemaining seconds,',
                      ),
                      _secondsRemaining == 0
                          ? TextButton(
                              onPressed: _resendOtp,
                              child: const Text(
                                StringConst.resend,
                                style: TextStyle(
                                  color: ColorConst.primaryColor,
                                ),
                              ))
                          : Container(),
                    ],
                  ),
                  FloatingActionButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    )),
                    backgroundColor: ColorConst.primaryColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _verifyOtp();
                      }
                    },
                    child: const Icon(Icons.navigate_next),
                  )
                ],
              ),
              const SizedBox(
                height: ColorConst.kDefaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
