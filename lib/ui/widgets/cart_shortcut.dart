// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/ui/screens/selection_screen.dart'; 
import 'package:e_commerce_app/utils/helpers/purchase.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';

class CartShortcut extends StatelessWidget {
  final Purchase purchase;
  
  const CartShortcut({ Key? key, required this.purchase }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectionScreen(product: purchase.product)),
        );
      },
      child: Row( 
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              this.purchase.product.image,
              fit: BoxFit.cover,
              height: sizeOfScreen.width / 4,
              width: sizeOfScreen.width / 5
            ),
          ),
          WidgetMethods.horizontalSpace(10),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetMethods.verticalSpace(5),
              Text(
                this.purchase.product.style,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: ColorConsts.black
                ),
              ),
              WidgetMethods.verticalSpace(5),
              Text(
                this.purchase.product.title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorConsts.black
                ),
              ), 
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "${Strings.size} ${this.purchase.size}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorConsts.black.withOpacity(0.8)
                  ),
                ),
              ), 
              Text.rich(
                TextSpan(
                  text: this.purchase.product.price.substring(0, 2),
                  style: const TextStyle(
                    color: ColorConsts.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: this.purchase.product.price.substring(2),
                      style: const TextStyle(
                        color: ColorConsts.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                ), 
              ), 
            ],
          ),
        ]
      ),
    );
  }
}