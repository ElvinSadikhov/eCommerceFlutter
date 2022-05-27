// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:flutter/material.dart';

class SignedBox extends StatelessWidget {
  final IconData iconData; 
  
  const SignedBox({ Key? key, required this.iconData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Text("pizdec");
    return Card(  
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(width: 1, color: ColorConsts.black)
      ),
      child: Icon(this.iconData, color: ColorConsts.black, size: 22)
    );
  }
}