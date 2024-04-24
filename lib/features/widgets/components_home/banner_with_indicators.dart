import 'dart:async';

import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../const/lists/card_list.dart';
import 'banner.dart';

class BannerWithIndicators extends StatefulWidget {
  const BannerWithIndicators({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<BannerWithIndicators> createState() => _BannerWithIndicatorsState();
}

class _BannerWithIndicatorsState extends State<BannerWithIndicators> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {});
    widget.pageController.addListener(() {
      setState(() {
        _currentPage = widget.pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 120,
          child: PageView.builder(
            itemCount: bannerList.length,
            controller: widget.pageController,
            itemBuilder: (context, index) {
              return BannerTile(
                image: bannerList[index].image,
                title: bannerList[index].title,
                subtitle: bannerList[index].subTitle,
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: MediaQuery.of(context).size.width * 0.5 - 40,
          child: Row(
            children: _buildIndicator(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < bannerList.length; i++) {
      _currentPage == i
          ? indicators.add(
              Container(
                width: 16,
                height: 5,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: ColorConst.primaryColor,
                ),
              ),
            )
          : indicators.add(Container(
              width: 5,
              height: 5,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: ColorConst.lightGreyColor,
              ),
            ));
    }

    return indicators;
  }
}
