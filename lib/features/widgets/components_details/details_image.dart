import 'package:flutter/material.dart';
import 'package:nectar/features/const/images.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageConst.apple);
  }
}
