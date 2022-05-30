// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:e_commerce_app/data/image_resources.dart';
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/ui/widgets/logo_box.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';

class DeliveryAddress extends StatelessWidget {
  final String title;
  final String subTitle;
  
  const DeliveryAddress({ Key? key, required this.title, required this.subTitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const LogoBox(imageAsset: ImageResources.geolocationLogoAsset),
            WidgetMethods.horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Text(
                  this.title, 
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: ColorConsts.black
                  ),
                ),
                WidgetMethods.verticalSpace(8),
                Text(
                  this.subTitle, 
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: ColorConsts.black.withOpacity(0.5)
                  ),
                ),
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            debugPrint("Delivery address details has been tapped!");
          },
          child: Icon(
            Icons.keyboard_arrow_right, 
            size: SizeConsts.logoBoxSize, 
            color: ColorConsts.black.withOpacity(0.6),
          )
        )
      ],
    );
  }
}