import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nectar/features/const/lists/bottom_navigation_list.dart';
import 'package:nectar/features/screens/home/sections/best_selling_section.dart';
import 'package:nectar/features/screens/home/sections/exclusive_offer_section.dart';
import 'package:nectar/features/screens/home/sections/groceries_section.dart';
import 'package:nectar/features/screens/home/sections/non_veg_section.dart';
import 'package:nectar/features/screens/home/sections/title_section.dart';

import '../../const/color.dart';
import '../../const/images.dart';
import '../../widgets/components_home/banner_with_indicators.dart';
import '../../widgets/components_home/search_field.dart';
import '../account/account_screen.dart';
import '../cart/cart_screen.dart';
import '../explore/explore_screen.dart';
import '../favourite/favourite_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textEditingController = TextEditingController();

  final _pageController = PageController();
  int _selectedIndex = 0;
  String? _city;
  String? _state;

  @override
  void initState() {
    super.initState();
    // getCityAndState();
    getUserData();
  }

  //
  // void getCityAndState() async {
  //   var box = await Hive.openBox(StringConst.location);
  //
  //   Map<dynamic, dynamic> data = box.get('1');
  //
  //   String address = data['address'];
  //   _city = address.split(',').elementAt(1);
  //   _state = address.split(',').elementAt(2);
  //   setState(() {});
  // }

  Future<void> getUserData() async {
    print('inside');
    var userBox = await Hive.openBox('userData');
    var userSavedInfo = await userBox.get('user');

    // Map<String, dynamic> data = await box.get('user');
    String address = userSavedInfo['address'];
    String name = userSavedInfo['name'];
    String email = userSavedInfo['email'];
    _city = address.split(',').elementAt(1);
    _state = address.split(',').elementAt(2);

    print('city is: $_city');
    print('state is: $_state');
    print('name is: $name');
    print('email is: $email');

    setState(() {});
  }

  Widget switchAccordingNavigation() {
    switch (_selectedIndex) {
      case 1:
        return ExploreScreen();
      case 2:
        return const CartScreen();
      case 3:
        return const FavouriteScreen();
      case 4:
        return const AccountScreen();
      default:
        return const AccountScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorConst.primaryColor,
        unselectedItemColor: ColorConst.titleTextColor,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        items: bottomNavigationList,
      ),
      body: _selectedIndex == 0
          ? _city == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: ColorConst.kDefaultPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: ColorConst.kDefaultPadding / 2,
                          ),
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset(ImageConst.carrotsRed),
                          ),
                          const SizedBox(
                            height: ColorConst.kDefaultPadding / 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: ColorConst.titleTextColor,
                              ),
                              Text(
                                '$_city,$_state',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: ColorConst.titleTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: ColorConst.kDefaultPadding,
                          ),
                          SearchField(
                            controller: _textEditingController,
                          ),
                          const SizedBox(
                            height: ColorConst.kDefaultPadding,
                          ),
                          BannerWithIndicators(pageController: _pageController),
                          const SizedBox(
                            height: ColorConst.kDefaultPadding + 10,
                          ),
                          const TitleSection(
                            leadingTitle: 'Exclusive Offer',
                            trailingTitle: 'See all',
                          ),
                          const SizedBox(
                            height: ColorConst.kDefaultPadding / 2,
                          ),
                          ExclusiveOfferSection(), // Exclusive offer section
                          const SizedBox(
                            height: ColorConst.kDefaultPadding,
                          ),
                          const TitleSection(
                            leadingTitle: 'Best Selling',
                            trailingTitle: 'See all',
                          ),
                          const SizedBox(
                            height: ColorConst.kDefaultPadding / 2,
                          ),
                          BestSellingSection(), // Best selling section
                          const SizedBox(
                            height: ColorConst.kDefaultPadding,
                          ),
                          const TitleSection(
                            leadingTitle: 'Groceries',
                            trailingTitle: 'See all',
                          ),
                          const SizedBox(
                            height: ColorConst.kDefaultPadding / 2,
                          ),
                          const GroceriesSection(),
                          const SizedBox(
                            height: ColorConst.kDefaultPadding,
                          ),
                          NonVegSection(),
                        ],
                      ),
                    ),
                  ),
                )
          : switchAccordingNavigation(),
    );
  }
}
