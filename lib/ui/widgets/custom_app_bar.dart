// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart'; 
import 'package:e_commerce_app/ui/widgets/custom_back_button.dart'; 
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconData rightSideIcon;
  final String label;

  const CustomAppBar({ Key? key, required this.rightSideIcon, required this.label }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(screenContext: context),
        Text(
          this.label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: ColorConsts.black,
          ),
        ),
        Icon(
          this.rightSideIcon,
          size: SizeConsts.kDefaultIconSize,
        )
      ]
    );
  }
}