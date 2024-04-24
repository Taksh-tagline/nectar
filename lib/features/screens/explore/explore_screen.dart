import 'package:flutter/material.dart';
import 'package:nectar/features/const/lists/find_product_list.dart';
import 'package:nectar/features/screens/explore/explore_details_screen.dart';
import 'package:nectar/features/widgets/components_explore/explore_tile.dart';
import 'package:nectar/features/widgets/components_home/search_field.dart';
import 'package:nectar/features/widgets/methods/methods.dart';

import '../../const/color.dart';
import 'list_filter_screen.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final _filterTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text('Find products',
              style: TextStyle(
                fontSize: 20,
                color: ColorConst.titleTextColor,
                fontWeight: FontWeight.w900,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Container(
              height: findProductsList.length / 2 * 190 + 200,
              child: Column(
                children: [
                  SearchField(
                    controller: _filterTextController,
                    onTap: () {
                      nextScreen(
                          context: context,
                          nextScreen: ListFilterScreen(
                            list: filterList,
                          ));
                    },
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    child: GridView.builder(
                        itemCount: findProductsList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.83,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print('Tapped');
                              nextScreen(
                                  context: context,
                                  nextScreen:
                                      ExploreDetailsScreen(index: index));
                            },
                            child: ExploreTile(
                              image: findProductsList[index].image,
                              title: findProductsList[index].title,
                              color: Color(int.parse(
                                findProductsList[index].color,
                              )),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
