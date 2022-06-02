import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/padding_consts.dart';
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/providers/favourite_state.dart';
import 'package:e_commerce_app/ui/widgets/product_item.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart';
import 'package:e_commerce_app/ui/widgets/custom_back_button.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 


class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({ Key? key }) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}  

class _FavouritesScreenState extends State<FavouritesScreen> {

  final FavouriteState favouriteState = FavouriteState();
 

  @override
  Widget build(BuildContext context) { 
    Size sizeOfScreen = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(PaddingConsts.kDefaultHorizontalPadding, sizeOfScreen.width * 0.16, PaddingConsts.kDefaultHorizontalPadding, 0),
        child: Column( 
          children: [ 
            Align(
              alignment: Alignment.centerLeft,
              child: CustomBackButton(screenContext: context),
            ),
            const Text(
              Strings.favouriteProducts,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorConsts.black
              ),
            ),
            WidgetMethods.verticalSpace(40),
            Expanded(
              child: Center(
                child: ListView.builder(  
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: context.read<FavouriteState>().favoutires.length,
                  itemBuilder: (context, index) {
                    return Padding( 
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ProductItem(
                        height: sizeOfScreen.height * 0.6, 
                        width: sizeOfScreen.width * 0.8, 
                        product: context.read<FavouriteState>().favoutires[index]
                      ),
                    );
                  }
                ),
              ),
            ), 
          ]
        ),
      )
    );
  }
}