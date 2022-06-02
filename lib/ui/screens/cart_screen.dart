import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/padding_consts.dart'; 
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/providers/cart_state.dart';
import 'package:e_commerce_app/ui/screens/checkout_screen.dart';
import 'package:e_commerce_app/ui/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/ui/widgets/cart_list.dart';
import 'package:e_commerce_app/ui/widgets/dashed_lines.dart';
import 'package:e_commerce_app/ui/widgets/price_widget.dart';
import 'package:e_commerce_app/utils/helpers/total_price.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class CartScreen extends StatelessWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size; 

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(PaddingConsts.kDefaultHorizontalPadding, sizeOfScreen.width * 0.16, PaddingConsts.kDefaultHorizontalPadding, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomAppBar(rightSideIcon: Icons.shopping_bag_sharp, label: Strings.myCart),
            WidgetMethods.verticalSpace(5),
            SizedBox(
              height: sizeOfScreen.height * 0.55,
              width: sizeOfScreen.width - 2 * PaddingConsts.kDefaultHorizontalPadding,
              child: const CartList()
            ),
            Expanded(
              child: Consumer<CartState>(
                builder: (context, CartState cartState, _) {
                  return Column(
                    children: [ 
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: PriceWidget(title: Strings.subTotal, price: cartState.getTotalPrice()),
                      ), 
                      const PriceWidget(title: Strings.shipping, price: Strings.shippingCost),
                      WidgetMethods.verticalSpace(20),
                      const DashedLines(), 
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: PriceWidget(title: Strings.total, price: TotalPrice.getTotal(cartState.getTotalPrice(), Strings.shippingCost)),
                      ), 
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: ColorConsts.black,
                            child: SizedBox(
                              width: sizeOfScreen.width - 2 * PaddingConsts.kDefaultHorizontalPadding,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 18),
                                  child: Text(
                                    Strings.checkout,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: ColorConsts.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }, 
              )
            )
          ],
        )
      ),
    );
  }
}

 