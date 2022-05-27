import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/padding_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:e_commerce_app/data/strings.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/ui/widgets/back_button.dart' as custom; 

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({ Key? key }) : super(key: key);

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
                custom.BackButton(screenContext: context),
                const Text(
                  Strings.myCart,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorConsts.black,
                  ),
                ),
                const Icon(
                  Icons.shopping_bag_sharp,
                  size: SizeConsts.kDefaultIconSize,
                )
              ],
            ),
            
          ],
        )
      ),
    );
  }
}