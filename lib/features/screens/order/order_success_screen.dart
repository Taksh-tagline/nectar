import 'package:flutter/material.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/images.dart';
import 'package:nectar/features/screens/home/home_screen.dart';
import 'package:nectar/features/widgets/custom_button.dart';
import 'package:nectar/features/widgets/methods/methods.dart';
import 'package:nectar/features/widgets/tap_icon.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  void _showPaymentFailAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            backgroundColor: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height * 0.66,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: TapIcon(
                        icon: ImageConst.closeIcon,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        height: 15,
                        width: 15,
                        color: ColorConst.titleTextColor,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 221,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(ImageConst.paymentFail),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Oops! Order Failed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorConst.titleTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Something went tembly wrong.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorConst.lightGreyColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      title: 'Please Try Again',
                      color: ColorConst.primaryColor,
                      onTap: () {}),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.89,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        child: const Center(
                            child: Text(
                          'Back to Home',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ))),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPaymentFailAlert();
        },
      ),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(ImageConst.paymentSuccessBack)),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(
                  height: 240,
                  width: 240,
                  child: Image.asset(ImageConst.paymentSuccess),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text(
                  'Your Order has been\naccepted',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: ColorConst.titleTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.032,
                ),
                const Text(
                  "Your items has been placed and is on\nit’s way to being processed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorConst.lightGreyColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                CustomButton(
                    title: 'Track Order',
                    color: ColorConst.primaryColor,
                    onTap: () {}),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    nextScreenReplace(
                        context: context, nextScreen: const HomePage());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.89,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(19.0),
                      ),
                      child: const Center(
                          child: Text(
                        'Back to Home',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
