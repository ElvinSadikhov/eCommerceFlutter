import 'package:e_commerce_app/consts/padding_consts.dart';
import 'package:flutter/material.dart';

class PurchaseItem extends StatefulWidget {
  const PurchaseItem({ Key? key }) : super(key: key);

  @override
  State<PurchaseItem> createState() => _PurchaseItemState();
}

class _PurchaseItemState extends State<PurchaseItem> {
  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.fromLTRB(PaddingConsts.kDefaultHorizontalPadding, sizeOfScreen.width * 0.16, PaddingConsts.kDefaultHorizontalPadding, 0),
      child: Row(
        children: [
          Image.asset()
        ],
      )
    );

  }
}