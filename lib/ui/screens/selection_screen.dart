// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart'; 
import 'package:e_commerce_app/consts/padding_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:e_commerce_app/data/data_sets.dart';
import 'package:e_commerce_app/providers/cart_state.dart';
import 'package:e_commerce_app/providers/color_state.dart';
import 'package:e_commerce_app/providers/size_state.dart';
import 'package:e_commerce_app/utils/helpers/product.dart';
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/providers/favourite_state.dart'; 
import 'package:e_commerce_app/ui/widgets/custom_back_button.dart'; 
import 'package:e_commerce_app/ui/widgets/color_box.dart'; 
import 'package:e_commerce_app/ui/widgets/size_option.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart';
import 'package:e_commerce_app/utils/helpers/purchase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionScreen extends StatelessWidget {
  final Product product; 
  final double heightOfBottomBar = 90; 
  
  SelectionScreen({ Key? key, required this.product }) : super(key: key);

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
                CustomBackButton(screenContext: context),
                Consumer<FavouriteState>(
                  builder:(context, FavouriteState favouriteState, _) { 

                    return GestureDetector(
                      onTap: () {
                        favouriteState.changeState(this.product);
                      },
                      child: favouriteState.isFavourite(this.product) ? 
                        const Icon(Icons.favorite, color: ColorConsts.red, size: SizeConsts.kDefaultIconSize) :
                          const Icon(Icons.favorite_border_outlined, size: SizeConsts.kDefaultIconSize),
                    ); 
                  }
                )
              ],
            ),
            WidgetMethods.verticalSpace(20),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: this.heightOfBottomBar),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical, 
                      child: Column(
                        children: [
                          Text(
                            "${this.product.style} ${this.product.title}",
                            style: const TextStyle(
                              color: ColorConsts.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          WidgetMethods.verticalSpace(15),
                          Text.rich(
                            TextSpan(
                              text: product.price.substring(0, 2),
                              style: const TextStyle(
                              color: ColorConsts.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            children: [
                              TextSpan(
                                text: product.price.substring(2),
                                style: const TextStyle(
                                  color: ColorConsts.black,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ],
                            ), 
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                this.product.image,
                                fit: BoxFit.cover,
                                height: sizeOfScreen.height * 0.5,
                                width: sizeOfScreen.width,
                              ),
                            ),
                          ), 
                          const Padding(
                            padding:  EdgeInsets.only(top: 10, bottom: 20),
                            child:  Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                Strings.selectSize,
                                style: TextStyle(
                                  color: ColorConsts.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ...DataSets.sizeOptions.map(
                                (size) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  child: SizeOption(
                                    label: size, 
                                    fontSize: 20
                                  ),
                                )
                              ),
                            ],
                          ),
                          const Padding(
                            padding:  EdgeInsets.only(top: 20, bottom: 10),
                            child:  Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                Strings.selectColor,
                                style: TextStyle(
                                  color: ColorConsts.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                ...ColorConsts.colorOptions.map((color) => ColorBox(fillColor: color)),
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 0, 
                    child: Container(
                      height: this.heightOfBottomBar,
                      width: sizeOfScreen.width - 2 * PaddingConsts.kDefaultHorizontalPadding,
                      color: ColorConsts.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: product.price.substring(0, 2),
                                style: const TextStyle(
                                color: ColorConsts.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                              children: [
                                TextSpan(
                                  text: product.price.substring(2),
                                  style: const TextStyle(
                                    color: ColorConsts.black,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ],
                              ), 
                            ), 
                            Consumer<CartState>(
                              builder: (context, CartState cartState, _) {
                                return  GestureDetector(
                                  onTap: () { 
                                    cartState.addToCart(
                                      Purchase(
                                        product: product, 
                                        size: context.read<SizeState>().selectedOption!, 
                                        color: context.read<ColorState>().selectedOption!,
                                        count: 1  
                                      )
                                    ); 
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Product has been added to the cart!")));
                                  },
                                  child:  ClipRRect( 
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: ColorConsts.black,
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                        child: Text(
                                          Strings.addToCart, 
                                          style: TextStyle(
                                            color: ColorConsts.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ),
                                    ), 
                                  ), 
                                );
                              }
                            )   
                          ],
                        ),
                      ),
                    ) 
                  ),
                ]
              ),
            ), 
          ],
        ),
      ),
    );
  }
}