import 'package:e_commerce_app/consts/color_consts.dart';  
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/providers/cart_state.dart';
import 'package:e_commerce_app/ui/widgets/operation_panel.dart'; 
import 'package:e_commerce_app/utils/helpers/widget_methods.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatefulWidget { 

  const CartList({ Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) { 

    Size sizeOfScreen = MediaQuery.of(context).size;

    return Consumer<CartState>(
      builder: (context, CartState cartState, _) {
        return SizedBox(
          height: sizeOfScreen.height * 0.8, 
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: cartState.purchases.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(   
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        cartState.purchases[index].product.image,
                        fit: BoxFit.cover,
                        height: 180,
                        width: 140,
                      ),
                    ),
                    WidgetMethods.horizontalSpace(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetMethods.verticalSpace(5),
                        Text(
                          cartState.purchases[index].product.style,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorConsts.black
                          ),
                        ),
                        WidgetMethods.verticalSpace(5),
                        Text(
                          cartState.purchases[index].product.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorConsts.black
                          ),
                        ), 
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "${Strings.size} ${cartState.purchases[index].size}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorConsts.grey.withOpacity(0.9)
                            ),
                          ),
                        ), 
                        Text.rich(
                          TextSpan(
                            text: cartState.purchases[index].product.price.substring(0, 2),
                            style: const TextStyle(
                              color: ColorConsts.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            children: [
                              TextSpan(
                                text: cartState.purchases[index].product.price.substring(2),
                                style: const TextStyle(
                                  color: ColorConsts.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ],
                          ), 
                        ),
                        WidgetMethods.verticalSpace(25),
                        OperationPanel(
                          indexOfPurchase: index
                        )
                      ],
                    ) 
                  ],
                ),
              );
            }
          ),
        );
      },  
    ); 
  }
} 