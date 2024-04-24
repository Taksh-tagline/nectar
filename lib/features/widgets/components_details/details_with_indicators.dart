import 'package:flutter/material.dart';
import 'package:nectar/features/models/card_model.dart';

import '../../const/color.dart';

class DetailsWithIndicators extends StatefulWidget {
  const DetailsWithIndicators(
      {super.key, required this.pageController, required this.cardModel});
  final PageController pageController;
  final CardModel cardModel;

  @override
  State<DetailsWithIndicators> createState() => _DetailsWithIndicatorsState();
}

class _DetailsWithIndicatorsState extends State<DetailsWithIndicators> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      setState(() {
        _currentPage = widget.pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: 3,
              controller: widget.pageController,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.cardModel.image[0],
                  scale: 0.35,
                );
              },
            ),
          ),
          Positioned(
            bottom: 30,
            left: MediaQuery.of(context).size.width * 0.5 - 20,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      _currentPage == i
          ? indicators.add(
              Container(
                width: 15.89,
                height: 3,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: ColorConst.primaryColor,
                ),
              ),
            )
          : indicators.add(Container(
              width: 3,
              height: 3,
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
