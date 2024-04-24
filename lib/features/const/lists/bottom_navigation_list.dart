import 'package:flutter/cupertino.dart';

import '../color.dart';
import '../images.dart';

List<BottomNavigationBarItem> bottomNavigationList = [
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.shop,
          color: ColorConst.primaryColor,
        ),
      ),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.shop,
          color: ColorConst.titleTextColor,
        ),
      ),
      label: 'Shop'),
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.explore,
          color: ColorConst.primaryColor,
        ),
      ),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.explore,
        ),
      ),
      label: 'Explore'),
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.cart,
          color: ColorConst.primaryColor,
        ),
      ),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.cart,
        ),
      ),
      label: 'Cart'),
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.favourite,
          color: ColorConst.primaryColor,
        ),
      ),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.favourite,
        ),
      ),
      label: 'Favourite'),
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.profile,
          color: ColorConst.primaryColor,
        ),
      ),
      icon: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(
          ImageConst.profile,
        ),
      ),
      label: 'Account'),
];
