import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/padding_consts.dart';
import 'package:e_commerce_app/providers/cart_state.dart';
import 'package:e_commerce_app/ui/widgets/signed_box.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class OperationPanel extends StatefulWidget { 
  final int indexOfPurchase;
  
  const OperationPanel({ Key? key, required this.indexOfPurchase}) : super(key: key);

  @override
  State<OperationPanel> createState() => _OperationPanelState();
}

class _OperationPanelState extends State<OperationPanel> {
  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;

    return Consumer<CartState>(
      builder: (context, CartState cartState, _) {
        return SizedBox(
          width: sizeOfScreen.width - 2 * PaddingConsts.kDefaultHorizontalPadding - 15 - 140,
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [  
              Row( 
                children: [
                  GestureDetector(
                    onTap: () {
                      if (cartState.purchases[widget.indexOfPurchase].count > 1) {
                        cartState.removeFromCart(cartState.purchases[widget.indexOfPurchase]);
                      }
                    },
                    child: const SignedBox(iconData: Icons.remove)
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "${cartState.purchases[widget.indexOfPurchase].count}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: ColorConsts.black
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      cartState.addToCart(cartState.purchases[widget.indexOfPurchase]);
                    },
                    child: const SignedBox(iconData: Icons.add)
                  )
                ],
              ), 
              GestureDetector(
                onTap: () {
                  cartState.removePurchase(cartState.purchases[widget.indexOfPurchase]);
                },
                child: const Icon(
                  Icons.close, 
                  size: 25
                ),
              ) 
            ]
          ),
        );
      }, 
    );
  }
}