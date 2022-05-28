// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:flutter/material.dart';

class LogoBox extends StatelessWidget {
  final String imageAsset;


  const LogoBox({ Key? key, required this.imageAsset }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: ColorConsts.white,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Image.asset(
            this.imageAsset,
            height: SizeConsts.logoBoxSize,
            width: SizeConsts.logoBoxSize, 
          ),
        ),
      ),
    );
  }
}