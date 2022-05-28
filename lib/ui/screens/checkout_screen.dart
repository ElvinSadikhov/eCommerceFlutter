import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/padding_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/providers/cart_state.dart';
import 'package:e_commerce_app/providers/payment_state.dart';
import 'package:e_commerce_app/ui/screens/cart_screen.dart';
import 'package:e_commerce_app/ui/screens/home_screen.dart';
import 'package:e_commerce_app/ui/widgets/back_button.dart' as custom;
import 'package:e_commerce_app/ui/widgets/cart_shortcut.dart';
import 'package:e_commerce_app/ui/widgets/delivery_address.dart';
import 'package:e_commerce_app/ui/widgets/payment_method_widget.dart';
import 'package:e_commerce_app/ui/widgets/price_widget.dart';
import 'package:e_commerce_app/utils/helpers/total_price.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({ Key? key }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorConsts.white.withOpacity(0.95),
      body: Padding(
        padding: EdgeInsets.fromLTRB(PaddingConsts.kDefaultHorizontalPadding, sizeOfScreen.width * 0.16, PaddingConsts.kDefaultHorizontalPadding, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custom.BackButton(screenContext: context),
                const Text(
                  Strings.checkout,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorConsts.black,
                  ),
                ),
                const Icon(Icons.more_vert, color: ColorConsts.black, size: SizeConsts.kDefaultIconSize,)
              ]
            ),
            WidgetMethods.verticalSpace(40),
            const Text(
              Strings.deliveryAddress,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorConsts.black
              ),
            ),
            WidgetMethods.verticalSpace(15),
            const DeliveryAddress(title: Strings.addressTitle, subTitle: Strings.addressSubtitle,),
            WidgetMethods.verticalSpace(20),
            const Text(
              Strings.paymentMethod,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorConsts.black
              ),
            ),
            WidgetMethods.verticalSpace(10),
            SizedBox(
              height: 200, // POKA TAK
              child: Consumer<PaymentState>(
                builder: (context, PaymentState paymentState, _) {
                  return ListView.builder( 
                    padding: EdgeInsets.zero,
                    itemCount: paymentState.paymentMethods.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: PaymentMethodWidget(paymentMethod:  paymentState.paymentMethods[index]), 
                      );
                    },
                  );
                }, 
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    Strings.myCart,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorConsts.black
                    ), 
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
                    },
                    child: Icon(
                      Icons.keyboard_arrow_right, 
                      size: SizeConsts.logoBoxSize, 
                      color: ColorConsts.black.withOpacity(0.6),
                    )
                  )
                ]
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...context.read<CartState>().purchases.sublist(0, context.read<CartState>().purchases.length >= 2 ? 2 : context.read<CartState>().purchases.length)
                  .map((purchase) => CartShortcut(purchase: purchase)) 
              ],
            ),
            Consumer<CartState>(
              builder: (context, CartState cartState, _) {
                return Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
                  child: PriceWidget(title: Strings.total, price: TotalPrice.getTotal(cartState.getTotalPrice(), Strings.shippingCost)),
                );
              },  
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ); 
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Payment was successful!")));
                
                context.read<CartState>().resetState(); 
              
                // need to play with local storage too
              
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
                          Strings.payNow,
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

            
          ]
        ),
      )
    );
  }
}