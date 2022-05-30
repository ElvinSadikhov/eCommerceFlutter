// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/padding_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:e_commerce_app/data/data_sets.dart';
import 'package:e_commerce_app/data/products.dart';
import 'package:e_commerce_app/data/strings.dart'; 
import 'package:e_commerce_app/ui/screens/cart_screen.dart';  
import 'package:e_commerce_app/ui/screens/favourites_screen.dart';  
import 'package:e_commerce_app/ui/widgets/carousel_new.dart';
import 'package:e_commerce_app/ui/widgets/category_option.dart'; 
import 'package:e_commerce_app/ui/widgets/product_item.dart'; 
import 'package:e_commerce_app/utils/helpers/widget_methods.dart'; 
import 'package:flutter/material.dart'; 

class HomeScreen extends StatelessWidget { 

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size; 

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(PaddingConsts.kDefaultHorizontalPadding, sizeOfScreen.width * 0.16, PaddingConsts.kDefaultHorizontalPadding, 0),
        child: Column(
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: SizeConsts.kDefaultIconSize),
                Row( 
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FavouritesScreen()),
                        );
                      },
                      child: const Icon(Icons.favorite, size: SizeConsts.kDefaultIconSize)
                    ),
                    WidgetMethods.horizontalSpace(15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CartScreen()),
                        );
                      },
                      child: const Icon(Icons.shopping_bag_sharp, size: SizeConsts.kDefaultIconSize)
                    ),
                  ],
                )
              ],
            ), 
            WidgetMethods.verticalSpace(10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Strings.title, 
                        style: TextStyle(
                          color: ColorConsts.black,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConsts.titleFontSize
                        ),
                      ),
                    ),
                    WidgetMethods.verticalSpace(20), 
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...DataSets.categoryOptions.map(
                          (label) => CategoryOption(label: label, fontSize: 16)
                        )
                      ],
                    ),  
                    WidgetMethods.verticalSpace(15),
                    const CarouselNew(),
                    // Carousel(sizeOfScreen: sizeOfScreen), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Most Popular",
                          style: TextStyle(
                            color: ColorConsts.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 22
                          ),
                        ),
                        GestureDetector(
                          onTap: () { 
                            debugPrint("See all has been tapped!");
                          },
                          child: const Text(
                            "See all",
                            style: TextStyle(
                              color: ColorConsts.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                      ],
                    ),  
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...(Products.products.sublist(0, 2)).map(
                            (product) => ProductItem(
                              height: sizeOfScreen.height * 0.30,
                              width: sizeOfScreen.width * 0.40, 
                              product: product, 
                              iconSize: SizeConsts.kDefaultIconSize * 0.75,
                            )
                          )
                        ],
                      ),
                    ), 
                  ],
                ),
              ),
            ) 
          ],
        ),
      ),
    );
  }
}