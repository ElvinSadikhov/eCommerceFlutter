// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/providers/payment_state.dart';
import 'package:e_commerce_app/utils/helpers/payment_method.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final double sizeOuter;
  final double sizeInner;
  final PaymentState paymentState;
  final PaymentMethod paymentMethod;
  
  const CustomRadioButton({ Key? key,
    required this.paymentMethod, 
    required this.paymentState,   
    required this.sizeOuter, 
    required this.sizeInner }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return InkResponse( 
      radius: this.sizeOuter + 1,
      onTap: () {
        this.paymentState.select(this.paymentMethod);
      },
      child: Container(
        width: this.sizeOuter,
        height: this.sizeOuter,
        decoration: BoxDecoration(
          color: this.paymentMethod.isSelected ? ColorConsts.orange : ColorConsts.grey,
          shape: BoxShape.circle,  
        ),
        child: Padding(
          padding: this.paymentMethod.isSelected ? const EdgeInsets.all(8.0) : const EdgeInsets.all(2.0),
          child: Container(
            height: this.sizeInner,
            width: this.sizeInner,
            decoration: const BoxDecoration(
              color: ColorConsts.white,
              shape: BoxShape.circle, 
            ),
          ),
        ),   
      ),
    ); 
  }
}
 