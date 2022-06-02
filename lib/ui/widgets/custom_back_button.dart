// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final BuildContext screenContext;

  const CustomBackButton({ Key? key, required this.screenContext }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(this.screenContext);
      },
      child: const Icon(Icons.arrow_back, size: SizeConsts.kDefaultIconSize)
    );
  }
}