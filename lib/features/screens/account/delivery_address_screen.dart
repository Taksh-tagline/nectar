import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/images.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/const/text_style.dart';
import 'package:nectar/features/screens/credentials/adrress_screen.dart';
import 'package:nectar/features/widgets/custom_button.dart';
import 'package:nectar/features/widgets/methods/methods.dart';

import '../../const/shared_preferences.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({
    super.key,
  });

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  bool _isLoactionGet = false;
  TextEditingController? _addressController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // temp();
    _loadAddress();
  }

  void temp() async {
    var box = await Hive.openBox('location');
    box.delete('1');
    print('clear');
  }

  void _loadAddress() async {
    var box = await Hive.openBox('location');

    print('Box data ===-=> ${box.get('1')['address']}');
    String address = box.get('1')['address'].toString();
    if (box.length == 0) {
      _isLoactionGet = false;
    } else {
      setState(() {
        _isLoactionGet = true;
        _addressController = TextEditingController(text: address);
      });
    }
  }

  void getCityAndState() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ImageConst.location),
                    const SizedBox(
                      height: ColorConst.kDefaultPadding,
                    ),
                    const Text(
                      StringConst.locationTitle,
                      style: CustomTextStyle.titleTextStyle,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      StringConst.locationDescription,
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_isLoactionGet == false)
                CustomButton(
                  title: StringConst.selectLocation,
                  color: ColorConst.primaryColor,
                  onTap: () {
                    nextScreen(context: context, nextScreen: const MapScreen());
                  },
                )
              else
                Form(
                  key: _formKey,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.47,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: _addressController,
                          maxLines: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address can not be an Empty';
                            }
                            if (value.length < 10) {
                              return 'check the length';
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                              color: ColorConst.primaryColor,
                            ),
                            contentPadding: const EdgeInsets.all(20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: ColorConst.kDefaultPadding,
                        ),
                        GestureDetector(
                          onTap: () {
                            nextScreenReplace(
                                context: context, nextScreen: MapScreen());
                          },
                          child: Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: ColorConst.primaryColor,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit_sharp,
                                  color: ColorConst.lightWhite,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: ColorConst.lightWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        CustomButton(
                            title: StringConst.submit,
                            color: ColorConst.primaryColor,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                var box = await Hive.openBox('location');
                                double latitude = box.get('1')['latitude'];
                                double longitude = box.get('1')['longitude'];

                                String? uid =
                                    await SharedPreferencesHelper.getUserUid();

                                String city = _addressController!.text
                                    .toString()
                                    .split(',')
                                    .elementAt(1);
                                String state = _addressController!.text
                                    .toString()
                                    .split(',')
                                    .elementAt(2);

                                var userBox = await Hive.openBox('userData');

                                var userSavedInfo = await userBox.get('user');

                                await FirebaseFirestore.instance
                                    .collection('userData')
                                    .doc(uid)
                                    .update({
                                  'address':
                                      _addressController!.text.toString(),
                                  'city': city,
                                  'state': state,
                                });

                                // add the data to the Hive
                                box.put('1', {
                                  'latitude': latitude,
                                  'longitude': longitude,
                                  'address':
                                      _addressController!.text.toString(),
                                }).then((value) {
                                  print('Success to Update');
                                });

                                userBox.put('user', {
                                  'name': userSavedInfo['name'],
                                  'email': userSavedInfo['email'],
                                  'password': userSavedInfo['password'],
                                  'uid': userSavedInfo['uid'],
                                  'address':
                                      _addressController!.text.toString(),
                                  'city': city,
                                  'state': state,
                                }).then((value) {
                                  print(
                                      'Success to store data in hive using SignUp');
                                  Navigator.pop(context);
                                });
                              }
                            })
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
