import 'package:flutter/material.dart';
import 'package:nectar/features/const/images.dart';
import 'package:nectar/features/models/hive/explore_hive_model.dart';
import 'package:nectar/features/screens/filter_screen.dart';
import 'package:nectar/features/widgets/components_home/search_field.dart';
import 'package:nectar/features/widgets/methods/methods.dart';
import 'package:nectar/features/widgets/tap_icon.dart';

import '../../widgets/components_home/card_tile.dart';

class ListFilterScreen extends StatefulWidget {
  const ListFilterScreen({super.key, required this.list});

  final List<CardExploreModel> list;

  @override
  State<ListFilterScreen> createState() => _ListFilterScreenState();
}

class _ListFilterScreenState extends State<ListFilterScreen> {
  final _filterController = TextEditingController();

  List<CardExploreModel> tempList = [];

  @override
  void initState() {
    super.initState();
    tempList = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchField(
                      controller: _filterController,
                      onChange: (value) {
                        print(value);
                        setState(() {
                          tempList = widget.list
                              .where((element) => element.title
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          _filterController.clear();
                          tempList = widget.list;
                          setState(() {});
                        },
                        icon: const Icon(Icons.cancel_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                    child: TapIcon(
                        icon: ImageConst.filterIcon,
                        onTap: () {
                          print('Filter print');
                          nextScreen(
                              context: context,
                              nextScreen: const FilterScreen());
                        }),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 0),
                  child: GridView.builder(
                      itemCount: tempList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        mainAxisExtent: 280,
                        childAspectRatio: 5,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              print('Tapped');
                            },
                            child: CardTile(
                              title: tempList[index].title,
                              subTitle: tempList[index].subtitle,
                              price: tempList[index].price,
                              onTap: () {},
                              image: tempList[index].image[0],
                            ));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
