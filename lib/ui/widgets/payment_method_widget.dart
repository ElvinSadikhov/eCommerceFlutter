// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/padding_consts.dart'; 
import 'package:e_commerce_app/providers/payment_state.dart';
import 'package:e_commerce_app/ui/widgets/custom_radio_button.dart';
import 'package:e_commerce_app/ui/widgets/logo_box.dart';
import 'package:e_commerce_app/utils/helpers/payment_method.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodWidget extends StatefulWidget {
  final PaymentMethod paymentMethod;
  
  const PaymentMethodWidget({ Key? key, required this.paymentMethod }) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;

    return Consumer<PaymentState>(
      builder: (context, PaymentState paymentState, _) {
        return SizedBox(
          width: sizeOfScreen.width - 2 * PaddingConsts.kDefaultHorizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  LogoBox(imageAsset: widget.paymentMethod.getLogoAsset()),
                  WidgetMethods.horizontalSpace(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      Text(
                        widget.paymentMethod.cardType, 
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: ColorConsts.black
                        ),
                      ),
                      WidgetMethods.verticalSpace(8),
                      Text(
                        widget.paymentMethod.getSecuredCardNumber(), 
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: ColorConsts.black.withOpacity(0.5)
                        ),
                      ),
                    ],
                  ), 
                ],
              ),
              GestureDetector(
                onTap: () {
                  debugPrint("New payment method has been choosen!");
                },
                child: CustomRadioButton(
                  paymentMethod: widget.paymentMethod, 
                  paymentState: paymentState,
                  sizeOuter: 25,
                  sizeInner: 10,
                )
              )
            ],
          ),
        );
      }, 
    );
  }
}

