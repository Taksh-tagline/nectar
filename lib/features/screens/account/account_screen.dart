import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/images.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/screens/account/edit_user_profile_screen.dart';
import 'package:nectar/features/screens/credentials/sign_in.dart';
import 'package:nectar/features/widgets/components_account/account_custom_tile.dart';
import 'package:nectar/features/widgets/methods/methods.dart';
import 'package:nectar/features/widgets/tap_icon.dart';

import 'delivery_address_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String? name;
  String? email;
  String? phone;
  bool _isDataLoad = false;
  String? imageLink =
      'https://firebasestorage.googleapis.com/v0/b/nectar-bbe2b.appspot.com/o/assets%2Fimages%2Fuser%2Fuser.jpeg?alt=media&token=10446d77-2a32-4e7a-b421-e1f4c42d0441';

  Future<void> _fetchTheUserData() async {
    final box = await Hive.openBox(StringConst.userData);

    final data = box.get('user');

    name = data['name'];
    email = data['email'];
    phone = data['phoneNumber'];
    imageLink = data['userProfileImage'];

    await box.put('user', {
      'name': data['name'],
      'email': data['email'],
      'password': data['password'],
      'uid': data['uid'],
      'phoneNumber': data['phoneNumber'],
      'state': data['state'],
      'address': data['address'],
      'city': data['city'],
      'userProfileImage': imageLink,
    });

    _isDataLoad = true;
    // print(data);
  }

  @override
  void initState() {
    super.initState();
    _fetchTheUserData().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !_isDataLoad
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 64,
                            width: 63,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: NetworkImage(imageLink ??
                                    'https://firebasestorage.googleapis.com/v0/b/nectar-bbe2b.appspot.com/o/assets%2Fimages%2Fuser%2Fuser.jpeg?alt=media&token=10446d77-2a32-4e7a-b421-e1f4c42d0441'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    name ?? 'User1',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: ColorConst.titleTextColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditUserProfileScreen(
                                            userName: name ?? '',
                                            email: email ?? '',
                                            phoneNumber: phone ?? '',
                                            userProfileImage: imageLink ??
                                                'https://firebasestorage.googleapis.com/v0/b/nectar-bbe2b.appspot.com/o/assets%2Fimages%2Fuser%2Fuser.jpeg?alt=media&token=10446d77-2a32-4e7a-b421-e1f4c42d0441',
                                          ),
                                        ),
                                      ).then(
                                        (value) {
                                          setState(() {
                                            _fetchTheUserData();
                                          });
                                        },
                                      );
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                (email!.isNotEmpty) ? email! : phone!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: ColorConst.titleTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: ColorConst.dividerColor,
                    ),
                    AccountCustomTile(
                      title: 'Orders',
                      icon: ImageConst.ordersIcon,
                      onTap: () {},
                    ),
                    const Divider(
                      color: ColorConst.dividerColor,
                    ),
                    AccountCustomTile(
                      title: 'My Details',
                      icon: ImageConst.myDetailsIcon,
                      onTap: () {},
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        color: ColorConst.dividerColor,
                      ),
                    ),
                    AccountCustomTile(
                      title: 'Delivery Address',
                      icon: ImageConst.locationIcon,
                      onTap: () {
                        nextScreen(
                          context: context,
                          nextScreen: const DeliveryAddressScreen(),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        color: ColorConst.dividerColor,
                      ),
                    ),
                    AccountCustomTile(
                      title: 'Payment Methods',
                      icon: ImageConst.paymentMethodsIcon,
                      onTap: () {},
                    ),
                    const Divider(
                      color: ColorConst.dividerColor,
                    ),
                    AccountCustomTile(
                      title: 'Promo code',
                      icon: ImageConst.promoCodeIcon,
                      onTap: () {},
                    ),
                    const Divider(
                      color: ColorConst.dividerColor,
                    ),
                    AccountCustomTile(
                      title: 'Notification',
                      icon: ImageConst.bellIcon,
                      onTap: () {},
                    ),
                    const Divider(
                      color: ColorConst.dividerColor,
                    ),
                    AccountCustomTile(
                      title: 'Help',
                      icon: ImageConst.helpIcon,
                      onTap: () {},
                    ),
                    const Divider(
                      color: ColorConst.dividerColor,
                    ),
                    AccountCustomTile(
                      title: 'About',
                      icon: ImageConst.aboutIcon,
                      onTap: () {},
                    ),
                    const Divider(
                      color: ColorConst.dividerColor,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Logout press');

                        FirebaseAuth.instance.signOut().then((value) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Log Out'),
                                  icon: const Icon(Icons.delete),
                                  content: const Text(
                                      'Are you sure you want to logout'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          nextScreenReplace(
                                              context: context,
                                              nextScreen: const SignInScreen());
                                        },
                                        child: const Text('Yes')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('No')),
                                  ],
                                );
                              });
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.89,
                        decoration: BoxDecoration(
                          color: ColorConst.searchField,
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            TapIcon(
                              icon: ImageConst.logoutIcon,
                              onTap: () {},
                              color: ColorConst.primaryColor,
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.40 - 70,
                            ),
                            const Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorConst.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
