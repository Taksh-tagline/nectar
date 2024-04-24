import 'package:flutter/material.dart';
import 'package:nectar/features/models/card_model.dart';

import '../../const/color.dart';
import '../../widgets/components_details/details_with_indicators.dart';
import '../../widgets/tap_icon.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({
    super.key,
    required PageController pageController,
    required this.cardModel,
  }) : _pageController = pageController;

  final PageController _pageController;
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 371,
      decoration: const BoxDecoration(
          color: ColorConst.productDetailsBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: ColorConst.kDefaultPadding,
                right: ColorConst.kDefaultPadding,
                top: ColorConst.kDefaultPadding / 2,
                bottom: ColorConst.kDefaultPadding + 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TapIcon(
                    icon: 'assets/icons/details/back.png',
                    onTap: () {
                      print('Tapped back');
                      Navigator.pop(context);
                    },
                  ),
                  TapIcon(
                    icon: 'assets/icons/details/share.png',
                    onTap: () {
                      print('Tapped share');
                    },
                  ),
                ],
              ),
            ),
            DetailsWithIndicators(
              pageController: _pageController,
              cardModel: cardModel,
            ),
          ],
        ),
      ),
    );
  }
}
