import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatefulWidget {
  final String title;
  final String price;

  const PriceWidget({ Key? key, required this.title, required this.price }) : super(key: key);

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: ColorConsts.black.withOpacity(0.6)
          ),
        ),
        Text.rich(
          TextSpan(
            text: widget.price.substring(0, 2),
            style: const TextStyle(
            color: ColorConsts.orange,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
            children: [
              TextSpan(
                text: widget.price.substring(2),
                style: const TextStyle(
                  color: ColorConsts.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                )
              )
            ],
          ), 
        )
      ], 
    );
  }
}