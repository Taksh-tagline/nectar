import 'package:flutter/material.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/images.dart';
import 'package:nectar/features/const/shared_preferences.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/screens/credentials/sign_in.dart';
import 'package:nectar/features/widgets/methods/methods.dart';

import '../widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/on_boarding_back.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              ImageConst.carrotsWhite,
              height: 56.36,
              width: 48.47,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringConst.welcome,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
                Text(
                  StringConst.toStore,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Text(
              StringConst.sloganOfApp,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: ColorConst.lightWhite,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            CustomButton(
              title: StringConst.getStarted,
              color: ColorConst.primaryColor,
              onTap: () async {
                await SharedPreferencesHelper.setOnBoardingStatus(true)
                    .then((value) {
                  nextScreenReplace(
                      context: context, nextScreen: const SignInScreen());
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            )
          ],
        ),
      ),
    );
  }
}
