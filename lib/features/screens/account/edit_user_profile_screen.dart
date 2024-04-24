import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/widgets/custom_button.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen(
      {super.key,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.userProfileImage});

  final String userName;
  final String email;
  final String phoneNumber;
  final String userProfileImage;

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _userNameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;
  FirebaseStorage _storage = FirebaseStorage.instance;

  File? _image;
  String imageLink = '';
  bool _isImageUplodedToFirebase = false;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);

      setState(() {});
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadThePickedFileToFirebase(File image) async {
    //Create a reference to the location you want to upload to in firebase
    final reference = _storage.ref().child("assets/images/user/");

    //Upload the file to firebase
    await reference.putFile(_image!);

    // Waits till the file is uploaded then stores the download url
    print('Completed');
    final link = await reference.getDownloadURL();
    imageLink = link;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController(text: widget.userName);
    _emailController = TextEditingController(text: widget.email);
    _phoneController = TextEditingController(text: widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                      // image: _image != null
                      //     ? DecorationImage(
                      //         image: NetworkImage(imageLink),
                      //         fit: BoxFit.cover,
                      //       )
                      //     : DecorationImage(
                      //         image: NetworkImage(
                      //           widget.userProfileImage,
                      //         ),
                      //         fit: BoxFit.cover,
                      //       ),
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  // child: Image.network(
                                  //   imageLink,
                                  //   fit: BoxFit.cover,
                                  //   loadingBuilder: (context, child, progress) {
                                  //     return progress == null
                                  //         ? child
                                  //         : const Center(
                                  //             child:
                                  //                 CircularProgressIndicator(),
                                  //           );
                                  //   },
                                  // ),
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    widget.userProfileImage,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, progress) {
                                      return progress == null
                                          ? child
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                    },
                                  ),
                                ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              print('tapped');
                              _pickImage(ImageSource.gallery);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: ColorConst.primaryColor),
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        // Align(
                        //   alignment: Alignment.center,
                        //   child: _image == null
                        //       ? Image.asset(
                        //           ImageConst.userProfileImage,
                        //           fit: BoxFit.cover,
                        //         )
                        //       : Image.file(_image!),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (_phoneController!.text.isEmpty) {
                        if (value!.isEmpty) {
                          return 'User name ca not be empty';
                        }
                      }
                    },
                    controller: _userNameController,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorConst.titleTextColor,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorConst.titleTextColor,
                        fontSize: 15,
                      ),
                      hintText: 'Enter the Name',
                      prefixIcon: const Icon(
                        Icons.supervised_user_circle,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (_phoneController!.text.isEmpty) {
                        if (value!.isEmpty) {
                          return 'Email can not be empty..';
                        }
                      }
                    },
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorConst.titleTextColor,
                      fontSize: 15,
                    ),
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter the Email',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.phoneNumber == ''
                      ? Container()
                      : TextFormField(
                          validator: (value) {
                            if (_userNameController!.text.isEmpty &&
                                _emailController!.text.isEmpty) {
                              if (value!.isEmpty) {
                                return 'Phone Number is empty..';
                              }
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorConst.titleTextColor,
                            fontSize: 15,
                          ),
                          controller: _phoneController,
                          decoration: InputDecoration(
                            hintText: 'Enter the PhoneNumber',
                            prefixIcon: const Icon(
                              Icons.phone,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  _isImageUplodedToFirebase == true
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.89,
                          decoration: BoxDecoration(
                            color: ColorConst.primaryColor,
                            borderRadius: BorderRadius.circular(19.0),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : CustomButton(
                          title: 'Update',
                          color: ColorConst.primaryColor,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              final _auth = FirebaseAuth.instance;

                              if (_image != null) {
                                setState(() {
                                  _isImageUplodedToFirebase = true;
                                });

                                await _uploadThePickedFileToFirebase(_image!)
                                    .then((value) {
                                  setState(() {
                                    _isImageUplodedToFirebase = true;
                                  });
                                });

                                FirebaseFirestore.instance
                                    .collection(StringConst.userDataCollection)
                                    .doc(_auth.currentUser!.uid)
                                    .update({
                                  'name': _userNameController!.text.toString(),
                                  'email': _emailController!.text.toString(),
                                  'phoneNumber':
                                      _phoneController!.text.toString(),
                                  'userProfileImage': imageLink,
                                });

                                final box =
                                    await Hive.openBox(StringConst.userData);

                                final data = box.get('user');

                                await box.put('user', {
                                  'name': _userNameController!.text.toString(),
                                  'email': _emailController!.text.toString(),
                                  'password': data['password'],
                                  'uid': data['uid'],
                                  'phoneNumber':
                                      _phoneController!.text.toString(),
                                  'state': data['state'],
                                  'address': data['address'],
                                  'city': data['city'],
                                  'userProfileImage': imageLink,
                                }).then((value) {
                                  Navigator.pop(context);
                                });
                              } else {
                                Navigator.pop(context);
                              }
                            }
                          },
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
