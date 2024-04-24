import 'package:flutter/material.dart';
import 'package:nectar/features/widgets/components_home/groceries_tile.dart';

import '../../../const/lists/card_list.dart';

class GroceriesSection extends StatelessWidget {
  const GroceriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: groceriesList.length,
        itemBuilder: (context, index) {
          var data = groceriesList.elementAt(index);
          return GroceriesTile(
            image: data.image,
            title: data.title,
            color: data.color,
          );
        },
      ),
    );
  }
}
