import 'package:flutter/material.dart';
import 'package:nectar/features/models/hive/explore_hive_model.dart';
import 'package:nectar/features/widgets/custom_button.dart';

import '../const/color.dart';
import '../const/lists/find_product_list.dart';
import '../const/string.dart';
import '../widgets/methods/methods.dart';
import 'explore/list_filter_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isVegetablesChecked = false;
  bool _isOilChecked = false;
  bool _isMeatChecked = false;
  bool _isBakeryChecked = false;
  bool _isSnacksChecked = false;
  bool _isSoapsChecked = false;
  bool _isBeveragesChecked = false;
  bool _isDairyChecked = false;
  List<String> list = [];

  List<String> categoryCheckBoxList = [
    'Fresh Fruits & Vegetable',
    'Cooking Oil & Ghee',
    'Meat & Fish',
    'Soaps',
    'Snacks',
    'Bakery & Snacks',
    'Beverages',
    'Dairy & Eggs',
  ];

  List<String> selectedCategory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: ColorConst.titleTextColor,
          ),
        ),
        centerTitle: true,
        title: const Text(
          StringConst.filterTitle,
          style: TextStyle(
            fontSize: 18,
            color: ColorConst.titleTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Color(0xffF2F3F2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 14.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Transform.scale(
              //       scale: 1.2,
              //       child: Checkbox(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         side: const BorderSide(
              //           width: 1.5,
              //         ),
              //         activeColor: ColorConst.primaryColor,
              //         value: _isVegetablesChecked,
              //         onChanged: (value) {
              //           setState(() {
              //             _isVegetablesChecked = value!;
              //             if (_isVegetablesChecked) {
              //               list.add(StringConst.vegetableCategory);
              //               print(list);
              //             } else {
              //               list.removeWhere((element) => element
              //                   .contains(StringConst.vegetableCategory));
              //               print(list);
              //             }
              //           });
              //         },
              //       ),
              //     ),
              //     Text(
              //       StringConst.vegetableCategory
              //               .substring(0, 1)
              //               .toUpperCase() +
              //           StringConst.vegetableCategory.substring(1),
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: _isVegetablesChecked == true
              //             ? ColorConst.primaryColor
              //             : ColorConst.titleTextColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Transform.scale(
              //       scale: 1.2,
              //       child: Checkbox(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         side: const BorderSide(
              //           width: 1.5,
              //         ),
              //         activeColor: ColorConst.primaryColor,
              //         value: _isOilChecked,
              //         onChanged: (value) {
              //           setState(() {
              //             _isOilChecked = value!;
              //             if (_isOilChecked) {
              //               list.add(StringConst.oilCategory);
              //               print(list);
              //             } else {
              //               list.removeWhere((element) =>
              //                   element.contains(StringConst.oilCategory));
              //               print(list);
              //             }
              //           });
              //         },
              //       ),
              //     ),
              //     Text(
              //       StringConst.oilCategory.substring(0, 1).toUpperCase() +
              //           StringConst.oilCategory.substring(1),
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: _isOilChecked == true
              //             ? ColorConst.primaryColor
              //             : ColorConst.titleTextColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Transform.scale(
              //       scale: 1.2,
              //       child: Checkbox(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         side: const BorderSide(
              //           width: 1.5,
              //         ),
              //         activeColor: ColorConst.primaryColor,
              //         value: _isMeatChecked,
              //         onChanged: (value) {
              //           setState(() {
              //             _isMeatChecked = value!;
              //
              //             if (_isMeatChecked) {
              //               list.add(StringConst.meatCategory);
              //               print(list);
              //             } else {
              //               list.removeWhere((element) =>
              //                   element.contains(StringConst.meatCategory));
              //               print(list);
              //             }
              //           });
              //         },
              //       ),
              //     ),
              //     Text(
              //       StringConst.meatCategory.substring(0, 1).toUpperCase() +
              //           StringConst.meatCategory.substring(1),
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: _isMeatChecked == true
              //             ? ColorConst.primaryColor
              //             : ColorConst.titleTextColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Transform.scale(
              //       scale: 1.2,
              //       child: Checkbox(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         side: const BorderSide(
              //           width: 1.5,
              //         ),
              //         activeColor: ColorConst.primaryColor,
              //         value: _isBakeryChecked,
              //         onChanged: (value) {
              //           setState(() {
              //             _isBakeryChecked = value!;
              //
              //             if (_isBakeryChecked) {
              //               list.add(StringConst.bakeryCategory);
              //               print(list);
              //             } else {
              //               list.removeWhere((element) =>
              //                   element.contains(StringConst.bakeryCategory));
              //               print(list);
              //             }
              //           });
              //         },
              //       ),
              //     ),
              //     Text(
              //       StringConst.bakeryCategory.substring(0, 1).toUpperCase() +
              //           StringConst.bakeryCategory.substring(1),
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: _isBakeryChecked == true
              //             ? ColorConst.primaryColor
              //             : ColorConst.titleTextColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Transform.scale(
              //       scale: 1.2,
              //       child: Checkbox(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         side: const BorderSide(
              //           width: 1.5,
              //         ),
              //         activeColor: ColorConst.primaryColor,
              //         value: _isSnacksChecked,
              //         onChanged: (value) {
              //           setState(() {
              //             _isSnacksChecked = value!;
              //
              //             if (_isSnacksChecked) {
              //               list.add(StringConst.snacksCategory);
              //               print(list);
              //             } else {
              //               list.removeWhere((element) =>
              //                   element.contains(StringConst.snacksCategory));
              //               print(list);
              //             }
              //           });
              //         },
              //       ),
              //     ),
              //     Text(
              //       StringConst.snacksCategory.substring(0, 1).toUpperCase() +
              //           StringConst.snacksCategory.substring(1),
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: _isSnacksChecked == true
              //             ? ColorConst.primaryColor
              //             : ColorConst.titleTextColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Transform.scale(
              //       scale: 1.2,
              //       child: Checkbox(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         side: const BorderSide(
              //           width: 1.5,
              //         ),
              //         activeColor: ColorConst.primaryColor,
              //         value: _isSoapsChecked,
              //         onChanged: (value) {
              //           setState(() {
              //             _isSoapsChecked = value!;
              //
              //             if (_isSoapsChecked) {
              //               list.add(StringConst.soapsCategory);
              //               print(list);
              //             } else {
              //               list.removeWhere((element) =>
              //                   element.contains(StringConst.soapsCategory));
              //               print(list);
              //             }
              //           });
              //         },
              //       ),
              //     ),
              //     Text(
              //       StringConst.soapsCategory.substring(0, 1).toUpperCase() +
              //           StringConst.soapsCategory.substring(1),
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: _isSoapsChecked == true
              //             ? ColorConst.primaryColor
              //             : ColorConst.titleTextColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Transform.scale(
              //       scale: 1.2,
              //       child: Checkbox(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         side: const BorderSide(
              //           width: 1.5,
              //         ),
              //         activeColor: ColorConst.primaryColor,
              //         value: _isBeveragesChecked,
              //         onChanged: (value) {
              //           setState(() {
              //             _isBeveragesChecked = value!;
              //
              //             if (_isBeveragesChecked) {
              //               list.add(StringConst.beveragesCategory);
              //               print(list);
              //             } else {
              //               list.removeWhere((element) => element
              //                   .contains(StringConst.beveragesCategory));
              //               print(list);
              //             }
              //           });
              //         },
              //       ),
              //     ),
              //     Text(
              //       StringConst.beveragesCategory
              //               .substring(0, 1)
              //               .toUpperCase() +
              //           StringConst.beveragesCategory.substring(1),
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: _isBeveragesChecked == true
              //             ? ColorConst.primaryColor
              //             : ColorConst.titleTextColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Transform.scale(
              //       scale: 1.2,
              //       child: Checkbox(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         side: const BorderSide(
              //           width: 1.5,
              //         ),
              //         activeColor: ColorConst.primaryColor,
              //         value: _isDairyChecked,
              //         onChanged: (value) {
              //           setState(() {
              //             _isDairyChecked = value!;
              //
              //             if (_isDairyChecked) {
              //               list.add(StringConst.dairyCategory);
              //               print(list);
              //             } else {
              //               list.removeWhere((element) =>
              //                   element.contains(StringConst.dairyCategory));
              //               print(list);
              //             }
              //           });
              //         },
              //       ),
              //     ),
              //     Text(
              //       StringConst.dairyCategory.substring(0, 1).toUpperCase() +
              //           StringConst.dairyCategory.substring(1),
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: _isDairyChecked == true
              //             ? ColorConst.primaryColor
              //             : ColorConst.titleTextColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //   ],
              // ),

              Expanded(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: categoryCheckBoxList.length,
                    itemBuilder: (context, index) {
                      var category = categoryCheckBoxList[index];
                      return CheckboxListTile(
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: ColorConst.primaryColor,
                        title: selectedCategory.contains(category)
                            ? Text(
                                categoryCheckBoxList[index],
                                style: const TextStyle(
                                  color: ColorConst.primaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : Text(
                                categoryCheckBoxList[index],
                                style: const TextStyle(
                                  color: ColorConst.titleTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gilory',
                                ),
                              ),
                        value: selectedCategory.contains(category),
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              selectedCategory.add(category);
                              print(selectedCategory);
                            } else {
                              selectedCategory.remove(category);
                              print(selectedCategory);
                            }
                          });
                        },
                      );
                    }),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                    title: 'Apply Filter',
                    color: ColorConst.primaryColor,
                    onTap: () {
                      print('Apply filter Tapped...');
                      // List<CardHiveModel> filterTempList = [];

                      // print(list);
                      // print(categoryViseList);
                      // for (int i = 0; i < list.length; i++) {
                      //   print('inside the first loop');
                      //   findProductsList.where((element) {
                      //     if (element.title.toLowerCase().contains(list[i])) {
                      //       print('inside the consdion');
                      //       for (int j = 0;
                      //           j < element.listProduct.length;
                      //           j++) {
                      //         print(categoryViseList);
                      //         categoryViseList.add(CardHiveModel(
                      //           title: element.listProduct[j].title,
                      //           subtitle: element.listProduct[j].subtitle,
                      //           image: element.listProduct[j].image,
                      //           price: element.listProduct[j].price,
                      //           productDetails:
                      //               element.listProduct[j].productDetails,
                      //           nutrition: NutritionHiveModel(
                      //             calories:
                      //                 element.listProduct[j].nutrition.calories,
                      //             vitamin:
                      //                 element.listProduct[j].nutrition.vitamin,
                      //             fibar: element.listProduct[j].nutrition.fibar,
                      //           ),
                      //           quantity: element.listProduct[j].quantity,
                      //           isFavourite: element.listProduct[j].isFavourite,
                      //           review: element.listProduct[j].review,
                      //           isAlreadyInBasket:
                      //               element.listProduct[j].isAlreadyInBasket,
                      //           productId: element.listProduct[j].productId,
                      //           category: element.listProduct[j].category,
                      //         ));
                      //       }
                      //
                      //       return true;
                      //     }
                      //     return false;
                      //   });
                      //
                      //   // filterTempList.addAll(filterList
                      //   //     .where((element) =>
                      //   //         element.title.toLowerCase().contains(list[i]))
                      //   //     .toList());
                      // }
                      // nextScreenReplace(
                      //     context: context,
                      //     nextScreen: ListFilterScreen(list: categoryViseList));
                      //
                      // print(
                      //     "find Product list length : ${findProductsList.length}");
                      //
                      // for (int i = 0; i < findProductsList.length; i++) {
                      //   if (selectedCategory.contains(
                      //       findProductsList[i].title.toLowerCase().trim())) {
                      //     print('inside');
                      //     tempList.addAll(
                      //       findProductsList[i].listProduct,
                      //     );
                      //     print(tempList);
                      //     // CardHiveModel(
                      //     //           title: findProductsList[i].listProduct[],
                      //     //           subtitle: ,
                      //     //           image: ,
                      //     //           price: ,
                      //     //           productDetails:,
                      //     //           nutrition: NutritionHiveModel(
                      //     //             calories:,
                      //     //             vitamin:,
                      //     //             fibar:,
                      //     //           ),
                      //     //           quantity: ,
                      //     //           isFavourite: ,
                      //     //           review: ,
                      //     //           isAlreadyInBasket:,
                      //     //           productId: ,
                      //     //           category: ,
                      //     //         ));
                      //   }
                      // }
                      //

                      List<CardExploreModel> tempList = [];

                      print(
                          "find Product list length : ${findProductsList.length}");

                      for (int i = 0; i < findProductsList.length; i++) {
                        print('Inside for loop');
                        print(
                            'Title is ======>: ${findProductsList[i].title.toLowerCase().trim()}');

                        if (selectedCategory
                            .contains(findProductsList[i].title.trim())) {
                          print('inside');
                          tempList.addAll(
                            findProductsList[i].listProduct,
                          );
                          print('isis ====> : {$tempList}');
                        }
                      }

                      nextScreenReplace(
                          context: context,
                          nextScreen: ListFilterScreen(list: tempList));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
