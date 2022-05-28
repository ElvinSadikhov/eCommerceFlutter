import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/padding_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/providers/payment_state.dart';
import 'package:e_commerce_app/ui/widgets/back_button.dart' as custom;
import 'package:e_commerce_app/ui/widgets/delivery_address.dart';
import 'package:e_commerce_app/ui/widgets/payment_method_widget.dart';
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
      backgroundColor: ColorConsts.white.withOpacity(0.9),
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
            WidgetMethods.verticalSpace(20),
            const DeliveryAddress(title: Strings.addressTitle, subTitle: Strings.addressSubtitle,),
            WidgetMethods.verticalSpace(30),
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

            
          ]
        ),
      )
    );
  }
}