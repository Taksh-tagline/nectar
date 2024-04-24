import 'package:nectar/features/models/hive/explore_hive_model.dart';

// List<FindProductModel> findProductsList = [
//   FindProductModel(
//     color: StringConst.findProductVegetablesColor,
//     image: ImageConst.vegetableThumbnail,
//     title: 'Fresh Fruits & Vegetable',
//     listProduct: [
//       CardModel(
//         title: 'Apple',
//         subtitle: '40gr, Price',
//         price: '2.99',
//         productDetails:
//             'Fresh and juicy apples from local orchards. Perfect for snacking or baking.',
//         image: [ImageConst.apple, ImageConst.apple, ImageConst.apple],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//         productId: '',
//       ),
//       CardModel(
//         title: 'Banana',
//         subtitle: '40gr, Price',
//         price: '1.99',
//         productDetails:
//             'Ripe bananas packed with potassium and nutrients. Great for a quick energy boost.',
//         image: [
//           ImageConst.banana,
//           ImageConst.banana,
//           ImageConst.banana,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         nutrition: Nutrition(
//           calories: '119gr',
//           vitamin: '4% of the Day',
//           fibar: '2gr.',
//         ),
//         productId: '',
//       ),
//       CardModel(
//         title: 'Strawberry',
//         subtitle: '40gr, Price',
//         price: '3.49',
//         productDetails:
//             'Plump and sweet strawberries bursting with flavor. Perfect for desserts or eating fresh.',
//         image: [
//           ImageConst.strawberry,
//           ImageConst.strawberry,
//           ImageConst.strawberry,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         nutrition: Nutrition(
//           calories: '102gr',
//           vitamin: '15% of the Day',
//           fibar: '14.1gr.',
//         ),
//         productId: '',
//       ),
//       CardModel(
//         title: 'Orange',
//         subtitle: '40gr, Price',
//         price: '2.49',
//         productDetails:
//             'Juicy oranges bursting with citrus flavor. Rich in vitamin C and antioxidants.',
//         image: [
//           ImageConst.orange,
//           ImageConst.orange,
//           ImageConst.orange,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//         productId: '',
//       ),
//       CardModel(
//         title: 'Carrot',
//         subtitle: '40gr, Price',
//         price: '1.79',
//         productDetails:
//             'Fresh and crunchy carrots packed with beta-carotene and essential nutrients. Perfect for salads or snacking.',
//         image: [
//           ImageConst.carrot,
//           ImageConst.carrot,
//           ImageConst.carrot,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         nutrition: Nutrition(
//           calories: '119gr',
//           vitamin: '4% of the Day',
//           fibar: '2gr.',
//         ),
//         productId: '',
//       ),
//       CardModel(
//         title: 'Grapes',
//         subtitle: '40gr, Price',
//         price: '4.99',
//         productDetails:
//             'Sweet and succulent grapes bursting with flavor. Enjoy as a healthy snack or add to fruit salads.',
//         image: [
//           ImageConst.grapes,
//           ImageConst.grapes,
//           ImageConst.grapes,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         nutrition: Nutrition(
//           calories: '102gr',
//           vitamin: '15% of the Day',
//           fibar: '14.1gr.',
//         ),
//         productId: '',
//       ),
//       CardModel(
//         title: 'Spinach',
//         subtitle: '40gr, Price',
//         price: '2.29',
//         productDetails:
//             'Nutrient-rich spinach leaves packed with vitamins and minerals. Perfect for salads, smoothies, or sautéing.',
//         image: [
//           ImageConst.spinach,
//           ImageConst.spinach,
//           ImageConst.spinach,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         nutrition: Nutrition(
//           calories: '119gr',
//           vitamin: '4% of the Day',
//           fibar: '2gr.',
//         ),
//         productId: '',
//       ),
//       CardModel(
//         title: 'Watermelon',
//         subtitle: '40gr, Price',
//         price: '3.99',
//         productDetails:
//             'Refreshing watermelon with sweet and juicy flesh. Enjoy chilled on a hot day or use in fruit salads.',
//         image: [
//           ImageConst.watermelon,
//           ImageConst.watermelon,
//           ImageConst.watermelon,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         nutrition: Nutrition(
//           calories: '119gr',
//           vitamin: '4% of the Day',
//           fibar: '2gr.',
//         ),
//         productId: '',
//       ),
//     ],
//   ),
//   FindProductModel(
//     color: StringConst.findProductOilColor,
//     image: ImageConst.oilThumbNail,
//     title: 'Cooking Oil & Ghee',
//     listProduct: [
//       CardModel(
//         title: 'Sunflower Oil',
//         subtitle: '40gr, Price',
//         price: '5.99',
//         productDetails:
//             'Sunflower oil is commonly used for cooking due to its light flavor and high smoke point. It is rich in vitamin E and low in saturated fats.',
//         image: [
//           ImageConst.sunflower,
//           ImageConst.sunflower,
//           ImageConst.sunflower,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '105gr.',
//           vitamin: '15% of the Day',
//           fibar: '2.5 gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Olive Oil',
//         subtitle: '40gr, Price',
//         price: '8.49',
//         productDetails:
//             'Olive oil is known for its health benefits and rich flavor. It is high in monounsaturated fats and antioxidants, making it ideal for cooking and salads.',
//         image: [
//           ImageConst.olive,
//           ImageConst.olive,
//           ImageConst.olive,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '205gr',
//           vitamin: '10% of the Day',
//           fibar: '0.2gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Canola Oil',
//         subtitle: '40gr, Price',
//         price: '4.99',
//         productDetails:
//             'Canola oil is derived from the rapeseed plant and has a neutral flavor. It is high in monounsaturated fats and low in saturated fats, making it a healthy choice for cooking.',
//         image: [
//           ImageConst.canola,
//           ImageConst.canola,
//           ImageConst.canola,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Coconut Oil',
//         subtitle: '40gr, Price',
//         price: '6.99',
//         productDetails:
//             'Coconut oil is popular for its unique flavor and versatility. It contains medium-chain triglycerides (MCTs) which are believed to have various health benefits.',
//         image: [
//           ImageConst.coconut,
//           ImageConst.coconut,
//           ImageConst.coconut,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Ghee',
//         subtitle: '40gr, Price',
//         price: '9.99',
//         productDetails:
//             'Ghee, also known as clarified butter, is commonly used in Indian cuisine. It has a rich, nutty flavor and a high smoke point, making it ideal for frying and sautéing.',
//         image: [
//           ImageConst.ghee,
//           ImageConst.ghee,
//           ImageConst.ghee,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Soybean Oil',
//         subtitle: '40gr, Price',
//         price: '3.99',
//         productDetails:
//             'Soybean oil is a popular vegetable oil derived from soybeans. It has a neutral flavor and is versatile for cooking various dishes.',
//         image: [
//           ImageConst.soyabean,
//           ImageConst.soyabean,
//           ImageConst.soyabean,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Palm Oil',
//         subtitle: '40gr, Price',
//         price: '7.99',
//         productDetails:
//             'Palm oil is derived from the fruit of oil palm trees and is commonly used in cooking and food processing. It has a distinct reddish color and is rich in antioxidants.',
//         image: [
//           ImageConst.palm,
//           ImageConst.palm,
//           ImageConst.palm,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '105gr.',
//           vitamin: '15% of the Day',
//           fibar: '2.5 gr.',
//         ),
//       )
//     ],
//   ),
//   FindProductModel(
//     color: StringConst.findProductMeatColor,
//     image: ImageConst.meatThumbNail,
//     title: 'Meat & Fish',
//     listProduct: [
//       CardModel(
//         title: 'Salmon Fillet',
//         subtitle: '40gr, Price',
//         price: '10.99',
//         productDetails:
//             'Fresh salmon fillet sourced from the cold waters of Alaska. Known for its rich flavor and high Omega-3 content. Perfect for grilling or baking.',
//         image: [
//           ImageConst.salmon,
//           ImageConst.salmon,
//           ImageConst.salmon,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Ribeye Steak',
//         subtitle: '40gr, Price',
//         price: '15.49',
//         productDetails:
//             'Premium ribeye steak carefully selected for its marbling and tenderness. Ideal for grilling or pan-searing. Serve with your favorite side dishes for a gourmet meal.',
//         image: [
//           ImageConst.ribeye,
//           ImageConst.ribeye,
//           ImageConst.ribeye,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Chicken Breast',
//         subtitle: '40gr, Price',
//         price: '7.99',
//         productDetails:
//             'Boneless, skinless chicken breast sourced from free-range chickens. Lean and protein-rich, perfect for grilling, baking, or stir-frying. Versatile and easy to cook.',
//         image: [
//           ImageConst.chickenMeat,
//           ImageConst.chickenMeat,
//           ImageConst.chickenMeat,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Tuna Steak',
//         subtitle: '40gr, Price',
//         price: '12.99',
//         productDetails:
//             'Fresh tuna steak hand-selected from the finest catches. Firm and flavorful, great for grilling, searing, or making sushi. Packed with protein and Omega-3 fatty acids.',
//         image: [
//           ImageConst.tuna,
//           ImageConst.tuna,
//           ImageConst.tuna,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Lamb Chops',
//         subtitle: '40gr, Price',
//         price: '18.99',
//         productDetails:
//             'Tender lamb chops from premium cuts of meat. Perfect for grilling or broiling. Serve with mint sauce for a classic flavor combination. A delicious and hearty meal option.',
//         image: [
//           ImageConst.lamb,
//           ImageConst.lamb,
//           ImageConst.lamb,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Shrimp',
//         subtitle: '40gr, Price',
//         price: '9.99',
//         productDetails:
//             'Fresh shrimp sourced directly from sustainable fisheries. Sweet and succulent, great for grilling, sautéing, or adding to pasta dishes. Quick and easy to prepare.',
//         image: [
//           ImageConst.shrimp,
//           ImageConst.shrimp,
//           ImageConst.shrimp,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Beef Burger Patties',
//         subtitle: '40gr, Price',
//         price: '6.49',
//         productDetails:
//             'Juicy beef burger patties made from premium ground beef. Seasoned to perfection and ready for grilling or pan-frying. Great for homemade burgers or sliders.',
//         image: [
//           ImageConst.beef,
//           ImageConst.beef,
//           ImageConst.beef,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Cod Fillet',
//         subtitle: '40gr, Price',
//         price: '11.99',
//         productDetails:
//             'Fresh cod fillet sustainably sourced from pristine waters. Mild and flaky, perfect for baking, broiling, or frying. Versatile and easy to prepare for a delicious seafood meal.',
//         image: [
//           ImageConst.lamb,
//           ImageConst.lamb,
//           ImageConst.lamb,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       )
//     ],
//   ),
//   FindProductModel(
//     color: StringConst.findProductBakeryColor,
//     image: ImageConst.bakeryThumbNail,
//     title: 'Bakery & Snacks',
//     listProduct: [
//       CardModel(
//         title: 'Chocolate Chip Cookies',
//         subtitle: '40gr, Price',
//         price: '2.99',
//         productDetails:
//             'Delicious chocolate chip cookies made with real cocoa and chunks of premium chocolate. Perfect for snacking any time of the day.',
//         image: [
//           ImageConst.chocolate,
//           ImageConst.chocolate,
//           ImageConst.chocolate,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '6% of the Day',
//           fibar: '1.5gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Salted Pretzels',
//         subtitle: '40gr, Price',
//         price: '1.49',
//         productDetails:
//             'Crunchy salted pretzels baked to perfection. A classic snack that pairs well with dips or enjoyed on its own.',
//         image: [
//           ImageConst.salted,
//           ImageConst.salted,
//           ImageConst.salted,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Caramel Popcorn',
//         subtitle: '40gr, Price',
//         price: '3.99',
//         productDetails:
//             'Irresistible caramel-coated popcorn that melts in your mouth with every bite. A sweet and savory treat for movie nights or gatherings.',
//         image: [
//           ImageConst.caramel,
//           ImageConst.caramel,
//           ImageConst.caramel,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr.',
//           vitamin: '15% of the Day',
//           fibar: '2.5 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Almond Biscotti',
//         subtitle: '40gr, Price',
//         price: '4.99',
//         productDetails:
//             'Traditional Italian almond biscotti made with roasted almonds and a hint of vanilla. Perfectly crunchy and great for dipping in coffee or tea.',
//         image: [
//           ImageConst.almond,
//           ImageConst.almond,
//           ImageConst.almond,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '305gr',
//           vitamin: '18% of the Day',
//           fibar: '4.5gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Mixed Nuts',
//         subtitle: '40gr, Price',
//         price: '6.49',
//         productDetails:
//             'A mix of roasted nuts including almonds, cashews, and peanuts. Packed with protein and healthy fats, it\'s a nutritious snack option for on-the-go.',
//         image: [
//           ImageConst.mixedBakery,
//           ImageConst.mixedBakery,
//           ImageConst.mixedBakery,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Granola Bars',
//         subtitle: '40gr, Price',
//         price: '2.79',
//         productDetails:
//             'Wholesome granola bars made with rolled oats, honey, nuts, and dried fruits. A satisfying snack that provides energy and nutrition for your day.',
//         image: [
//           ImageConst.granolaBars,
//           ImageConst.granolaBars,
//           ImageConst.granolaBars,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr.',
//           vitamin: '15% of the Day',
//           fibar: '2.5 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Cheese Crackers',
//         subtitle: '40gr, Price',
//         price: '3.29',
//         productDetails:
//             'Crispy cheese crackers baked with real cheddar cheese. A savory and cheesy snack that is perfect for packing in lunchboxes or enjoying as a quick bite.',
//         image: [
//           ImageConst.cheeseCrackers,
//           ImageConst.cheeseCrackers,
//           ImageConst.cheeseCrackers,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '305gr',
//           vitamin: '18% of the Day',
//           fibar: '4.5gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Cinnamon Rolls',
//         subtitle: '40gr, Price',
//         price: '5.99',
//         productDetails:
//             'Soft and fluffy cinnamon rolls made with swirls of cinnamon sugar and topped with creamy icing. Enjoy them warm for a comforting and indulgent treat.',
//         image: [
//           ImageConst.cinnamon,
//           ImageConst.cinnamon,
//           ImageConst.cinnamon,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '6% of the Day',
//           fibar: '1.5gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//     ],
//   ),
//   FindProductModel(
//     color: StringConst.findProductDairyColor,
//     image: ImageConst.dairyThumbNail,
//     title: 'Dairy & Eggs',
//     listProduct: [
//       CardModel(
//         title: 'Cheese Crackers',
//         subtitle: '40gr, Price',
//         price: '2.49',
//         productDetails:
//             'Delicious cheese-flavored crackers perfect for snacking.',
//         image: [
//           ImageConst.cheeseCrackers,
//           ImageConst.cheeseCrackers,
//           ImageConst.cheeseCrackers,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Yogurt',
//         subtitle: '40gr, Price',
//         price: '1.99',
//         productDetails:
//             'Creamy yogurt packed with probiotics for a healthy gut.',
//         image: [
//           ImageConst.yogurt,
//           ImageConst.yogurt,
//           ImageConst.yogurt,
//         ],
//         quantity: 1,
//         isFavourite: true,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '205gr',
//           vitamin: '10% of the Day',
//           fibar: '0.2gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Boiled Eggs',
//         subtitle: '40gr, Price',
//         price: '0.99',
//         productDetails:
//             'Fresh and protein-rich boiled eggs perfect for a quick snack or salad topping.',
//         image: [
//           ImageConst.boiledEgge,
//           ImageConst.boiledEgge,
//           ImageConst.boiledEgge,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '205gr',
//           vitamin: '10% of the Day',
//           fibar: '0.2gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Mixed Nuts',
//         subtitle: '40gr, Price',
//         price: '3.79',
//         productDetails:
//             'A mix of roasted nuts including almonds, cashews, and peanuts for a crunchy and satisfying snack.',
//         image: [
//           ImageConst.mixedDairy,
//           ImageConst.mixedDairy,
//           ImageConst.mixedDairy,
//         ],
//         quantity: 1,
//         isFavourite: true,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '305gr',
//           vitamin: '18% of the Day',
//           fibar: '4.5gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Chocolate Milk',
//         subtitle: '40gr, Price',
//         price: '2.99',
//         productDetails:
//             'Creamy and indulgent chocolate milk perfect for satisfying your sweet tooth.',
//         image: [
//           ImageConst.chocolateMilk,
//           ImageConst.chocolateMilk,
//           ImageConst.chocolateMilk,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Greek Yogurt',
//         subtitle: '40gr, Price',
//         price: '2.49',
//         productDetails:
//             'Thick and creamy Greek yogurt with a hint of honey for a delightful taste.',
//         image: [
//           ImageConst.greekYogurt,
//           ImageConst.greekYogurt,
//           ImageConst.greekYogurt,
//         ],
//         quantity: 1,
//         isFavourite: true,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '305gr',
//           vitamin: '18% of the Day',
//           fibar: '4.5gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Hard-boiled Eggs',
//         subtitle: '40gr, Price',
//         price: '1.29',
//         productDetails:
//             'Convenient hard-boiled eggs, peeled and ready to eat for a protein-packed snack.',
//         image: [
//           ImageConst.hardBoiledEgge,
//           ImageConst.hardBoiledEgge,
//           ImageConst.hardBoiledEgge,
//         ],
//         quantity: 1,
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '205gr',
//           vitamin: '10% of the Day',
//           fibar: '0.2gr.',
//         ),
//       ),
//       CardModel(
//         title: 'Cottage Cheese',
//         subtitle: '40gr, Price',
//         price: '2.19',
//         productDetails:
//             'Smooth and creamy cottage cheese, low in fat and high in protein.',
//         image: [
//           ImageConst.cottageCheese,
//           ImageConst.cottageCheese,
//           ImageConst.cottageCheese,
//         ],
//         quantity: 1,
//         isFavourite: true,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//         nutrition: Nutrition(
//           calories: '105gr',
//           vitamin: '12% of the Day',
//           fibar: '20gr.',
//         ),
//       ),
//     ],
//   ),
//   FindProductModel(
//     color: StringConst.findProductBeveragesColor,
//     image: ImageConst.beveragesThumbNail,
//     title: 'Beverages',
//     listProduct: [
//       CardModel(
//         title: 'Diet Coke',
//         subtitle: '355ml, Price',
//         price: '1.99',
//         productDetails:
//             'Diet Coke (also branded as Coca-Cola Light, Coca-Cola Diet or Coca-Cola Light Taste) is a sugar-free and low-calorie soft drink produced and distributed by the Coca-Cola Company. It contains artificial sweeteners instead of sugar.',
//         image: [
//           ImageConst.dietCoke,
//           ImageConst.dietCoke,
//           ImageConst.dietCoke,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '10gr.',
//           vitamin: '3% of the Day',
//           fibar: '0.5 gr',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Sprite Can',
//         subtitle: '325ml, Price',
//         price: '1.50',
//         productDetails:
//             'Carbonated Water, Sugar, Acidity Regulators (330, 331), Preservative (211). Contains Added Flavours (Natural Flavouring Substances). CONTAINS NO FRUIT.',
//         image: [
//           ImageConst.sprite,
//           ImageConst.sprite,
//           ImageConst.sprite,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '11gr.',
//           vitamin: '3.5% of the Day',
//           fibar: '1.5 gr',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Apple & Grape Juice',
//         subtitle: '2L, Price',
//         price: '15.99',
//         productDetails:
//             'Apple benefits diabetics as the soluble fibre assists in regulating blood sugar and is heart friendly. See detailed 9 health benefits of apple. 2. Green Grapes : The flavonoid quercitin found in grapes helps to reduce the risk of heart diseases and prevents the onset of stroke.',
//         image: [
//           ImageConst.appleJuice,
//           ImageConst.appleJuice,
//           ImageConst.appleJuice,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '210gr.',
//           vitamin: '13.45% of the Day',
//           fibar: '2.56 gr',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Orange Juice',
//         subtitle: '2L, Price',
//         price: '16.99',
//         productDetails:
//             'Orange juice is packed with many nutritional benefits like carbohydrates, proteins, fibres, and minerals like iron, calcium, zinc, and sodium. vitamins such as vitamins A, C, and B are also present in orange juice. Drinking orange juice might also help with conditions such as heart diseases, obesity, and cancer.',
//         image: [
//           ImageConst.orangeJuice,
//           ImageConst.orangeJuice,
//           ImageConst.orangeJuice,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '225gr.',
//           vitamin: '14.47% of the Day',
//           fibar: '3.05 gr',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Coca Cola Can',
//         subtitle: '325ml, Price',
//         price: '4.99',
//         productDetails:
//             'The Coca-Cola Company (NYSE: KO) is a total beverage company with products sold in more than 200 countries and territories. Our companys purpose is to refresh the world and make a difference. We sell multiple billion-dollar brands across several beverage categories worldwide.',
//         image: [
//           ImageConst.cocacola,
//           ImageConst.cocacola,
//           ImageConst.cocacola,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '46gr.',
//           vitamin: '8.09% of the Day',
//           fibar: '2.87 gr',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Pepsi Can',
//         subtitle: '330ml, Price',
//         price: '4.49',
//         productDetails:
//             'Pepsi: Similarly, a standard serving size of Pepsi is also typically 12 fluid ounces (355 milliliters). In a 12-ounce can of regular Pepsi, there are approximately 41 grams of sugar. This amount is roughly equivalent to about 10.25 teaspoons of sugar.',
//         image: [
//           ImageConst.pepsi,
//           ImageConst.pepsi,
//           ImageConst.pepsi,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '44gr.',
//           vitamin: '9.09% of the Day',
//           fibar: '3.06 gr',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: '7 Up',
//         subtitle: '345ml, Price',
//         price: '4.05',
//         productDetails:
//             '7 Up (stylized as 7up outside the United States) or Seven Up is an American brand of lemon-lime–flavored non-caffeinated soft drink. The brand and formula are owned by Keurig Dr Pepper, although the beverage is internationally distributed by PepsiCo.',
//         image: [
//           ImageConst.up7,
//           ImageConst.up7,
//           ImageConst.up7,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '189gr.',
//           vitamin: '3.56% of the Day',
//           fibar: '4.05 gr',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Chocolate Milk',
//         subtitle: '925ml, Price',
//         price: '8.94',
//         productDetails:
//             'Cocoa or chocolate milk drinks are dairy-based products, which are manufactured from heat-treated milk with the addition of cocoa powder and sugar and eventually stabilizers.',
//         image: [
//           ImageConst.chocolateMilk,
//           ImageConst.chocolateMilk,
//           ImageConst.chocolateMilk,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '210gr.',
//           vitamin: '6.27% of the Day',
//           fibar: '4.98 gr',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//     ],
//   ),
//   FindProductModel(
//     color: StringConst.findProductSoapsColor,
//     image: ImageConst.soapThumbNail,
//     title: 'Soaps',
//     listProduct: [
//       CardModel(
//         title: 'Hand Soap',
//         subtitle: '4pic, Prices',
//         price: '5.99',
//         productDetails:
//             'This gentle foaming hand soap is perfect for everyday use. It cleanses hands thoroughly while leaving them feeling soft and smooth. The invigorating citrus scent is uplifting and refreshing.',
//         image: [
//           ImageConst.handSoap,
//           ImageConst.handSoap,
//           ImageConst.handSoap,
//         ], // Replace with actual image paths
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr.',
//           vitamin: '15% of the Day',
//           fibar: '2.5 gr.',
//         ), // Or provide relevant nutrition information if applicable
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Cetaphil',
//         subtitle: '6pic, Prices',
//         price: '6.99',
//         productDetails:
//             'Cetaphil soap is known for its gentle cleansing formula. Recommended by dermatologists, Cetaphil soap is suitable for sensitive skin and helps maintain your skins natural pH balance. 7',
//         image: [
//           ImageConst.cetaphil,
//           ImageConst.cetaphil,
//           ImageConst.cetaphil,
//         ], // Replace with actual image paths
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '175gr.',
//           vitamin: '13% of the Day',
//           fibar: '3.5 gr.',
//         ), // Or provide relevant nutrition information if applicable
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Nivea Soap',
//         subtitle: '3pic, Prices',
//         price: '3.79',
//         productDetails:
//             'Nivea soap is known for its refreshing scent and gentle cleansing. Enriched with natural oils, Nivea soap revitalizes your skin and leaves it feeling fresh and smooth. 8',
//         image: [
//           ImageConst.nivea,
//           ImageConst.nivea,
//           ImageConst.nivea,
//         ], // Replace with actual image paths
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '19% of the Day',
//           fibar: '6.5 gr.',
//         ), // Or provide relevant nutrition information if applicable
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Olay Soap',
//         subtitle: '6pic, Prices',
//         price: '4.29',
//         productDetails:
//             'Olay soap is known for its ultra-moisturizing formula. Infused with shea butter and vitamin E, Olay soap provides long-lasting hydration and softness to your skin. 6',
//         image: [
//           ImageConst.olay,
//           ImageConst.olay,
//           ImageConst.olay,
//         ], // Replace with actual image paths
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ), // Or provide relevant nutrition information if applicable
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Irish Spring',
//         subtitle: '5pic, Prices',
//         price: '2.99',
//         productDetails:
//             'Irish Spring soap is known for its invigorating scent. Made with natural ingredients, Irish Spring soap leaves you feeling refreshed and energized. 5',
//         image: [
//           ImageConst.irish,
//           ImageConst.irish,
//           ImageConst.irish,
//         ], // Replace with actual image paths
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '195gr.',
//           vitamin: '18% of the Day',
//           fibar: '4.5 gr.',
//         ), // Or provide relevant nutrition information if applicable
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Pears Soap',
//         subtitle: '5pic, Prices',
//         price: '2.79',
//         productDetails:
//             'Pears soap is known for its gentle care formula. Enriched with glycerin and natural oils, Pears soap helps maintain your skin\'s natural moisture balance, leaving it soft and smooth. 3',
//         image: [
//           ImageConst.pears,
//           ImageConst.pears,
//           ImageConst.pears,
//         ], // Replace with actual image paths
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '165gr.',
//           vitamin: '16.5% of the Day',
//           fibar: '4.05 gr.',
//         ), // Or provide relevant nutrition information if applicable
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Lux',
//         subtitle: '5pic, Prices',
//         price: '2.99',
//         productDetails:
//             'Lux is a famous brand known for its soft and gentle soaps. Made with premium ingredients, Lux soaps leave your skin feeling smooth and refreshed. 1',
//         image: [
//           ImageConst.lux,
//           ImageConst.lux,
//           ImageConst.lux,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '100gr.',
//           vitamin: '16% of the day',
//           fibar: '2 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Dove',
//         subtitle: '4pic, Prices',
//         price: '3.49',
//         productDetails:
//             'Dove soap is known for its moisturizing properties. Made with gentle cleansers and 1/4 moisturizing cream, Dove soap leaves your skin soft, smooth, and hydrated. 2',
//         image: [
//           ImageConst.dove,
//           ImageConst.dove,
//           ImageConst.dove,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '120 gr',
//           vitamin: '12% per day',
//           fibar: '1.5gr',
//         ),
//         isFavourite: true,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//     ],
//   ),
//   FindProductModel(
//     color: StringConst.findProductSnacksColor,
//     image: ImageConst.snacksThumbNail,
//     title: 'Snacks',
//     listProduct: [
//       CardModel(
//         title: 'Chips',
//         subtitle: '40gr, Price',
//         price: '1.29', // Random price between 0 and 10
//         productDetails:
//             'Delicious crispy chips perfect for snacking. Made with high-quality ingredients and seasoned to perfection.',
//         image: [
//           ImageConst.chips,
//           ImageConst.chips,
//           ImageConst.chips,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr.',
//           vitamin: '15% of the Day',
//           fibar: '2.5 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Cookies',
//         subtitle: '35gr, Price',
//         price: '1.56',
//         productDetails:
//             'Sweet and crunchy cookies that melt in your mouth. Enjoy with a glass of milk or your favorite hot beverage.',
//         image: [
//           ImageConst.cookies,
//           ImageConst.cookies,
//           ImageConst.cookies,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Nuts',
//         subtitle: '48gr, Price',
//         price: '1.89',
//         productDetails:
//             'A healthy and satisfying snack option. Our mix of nuts is packed with protein and essential nutrients.',
//         image: [
//           ImageConst.mixed,
//           ImageConst.mixed,
//           ImageConst.mixed,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr.',
//           vitamin: '15% of the Day',
//           fibar: '2.5 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Popcorn',
//         subtitle: '43gr, Price',
//         price: '1.68',
//         productDetails:
//             'Light and fluffy popcorn kernels popped to perfection. Enjoy as a guilt-free snack for movie nights or anytime cravings strike.',
//         image: [
//           ImageConst.popcorn,
//           ImageConst.popcorn,
//           ImageConst.popcorn,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Granola Bars',
//         subtitle: '37gr, Price',
//         price: '1.24',
//         productDetails:
//             'Wholesome and delicious granola bars packed with oats, nuts, seeds, and dried fruits. Perfect for a quick energy boost on the go.',
//         image: [
//           ImageConst.granolaBars,
//           ImageConst.granolaBars,
//           ImageConst.granolaBars,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Pretzels',
//         subtitle: '47gr, Price',
//         price: '1.32',
//         productDetails:
//             'Salty and crunchy pretzels twisted into fun shapes. A classic snack that pairs perfectly with your favorite dips or cheese.',
//         image: [
//           ImageConst.pretzels,
//           ImageConst.pretzels,
//           ImageConst.pretzels,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr.',
//           vitamin: '15% of the Day',
//           fibar: '2.5 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Dried Fruit',
//         subtitle: '46gr, Price',
//         price: '1.56',
//         productDetails:
//             'Naturally sweet and chewy dried fruits packed with vitamins and antioxidants. A healthy and delicious alternative to sugary snacks.',
//         image: [
//           ImageConst.dried_fruit,
//           ImageConst.dried_fruit,
//           ImageConst.dried_fruit,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '125gr.',
//           vitamin: '14% of the Day',
//           fibar: '2.67 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//       CardModel(
//         title: 'Candy',
//         subtitle: '41gr, Price',
//         price: '1.57',
//         productDetails:
//             'Indulge your sweet tooth with a variety of colorful and flavorful candies. Perfect for satisfying cravings and sharing with friends.',
//         image: [
//           ImageConst.candy,
//           ImageConst.candy,
//           ImageConst.candy,
//         ],
//         quantity: 1,
//         nutrition: Nutrition(
//           calories: '105gr.',
//           vitamin: '15% of the Day',
//           fibar: '2.5 gr.',
//         ),
//         isFavourite: false,
//         isAlreadyInBasket: false,
//         review: 5,
//         productId: '',
//       ),
//     ],
//   ),
// ];

List<ExploreHiveModel> findProductsList = [];

List<CardExploreModel> filterList = [];
