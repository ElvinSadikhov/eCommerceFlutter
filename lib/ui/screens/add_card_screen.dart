// ignore_for_file: unnecessary_this

import 'package:awesome_card/awesome_card.dart';
import 'package:e_commerce_app/consts/padding_consts.dart'; 
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/providers/new_card_state.dart';
import 'package:e_commerce_app/ui/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({ Key? key }) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool isOnBackSide = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryDateController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController cardCvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size; 

    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: Padding(
        padding: EdgeInsets.fromLTRB(PaddingConsts.kDefaultHorizontalPadding, sizeOfScreen.width * 0.16, PaddingConsts.kDefaultHorizontalPadding, 0),
        child: Column(
          children: [
            const CustomAppBar(rightSideIcon: Icons.more_vert, label: Strings.addNewCard),
            WidgetMethods.verticalSpace(20),
            Consumer<NewCardState>(
              builder: (context, NewCardState newCardState, _) {
                return Column(
                  children: [
                    CreditCard(
                      cardNumber: newCardState.number,
                      cardExpiry: newCardState.expryDate,
                      cardHolderName: newCardState.holderName,
                      cvv: newCardState.cvv,
                      bankName: Strings.fastacy,
                      cardType: newCardState.type,  
                      showBackSide: newCardState.isOnBackSide, // static stuff
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.white,
                      showShadow: true,
                      textExpDate: 'Exp. Date',
                      textName: 'Name',
                      textExpiry: 'MM/YY'
                    ), 
                    WidgetMethods.verticalSpace(25), 
                    TextFormField(
                      controller: this.cardHolderController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Card Holder',
                        labelStyle: TextStyle(color: Color(0x77737876)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0x77737876)),
                        ),
                      ),
                      onChanged: (value) {
                        newCardState.setData(newHolderName: value);
                      },
                    ),
                    WidgetMethods.verticalSpace(10), 
                    TextFormField(
                      controller: this.cardNumberController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                        labelStyle: TextStyle(color: Color(0x77737876)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0x77737876)),
                        ),
                      ),
                      onChanged: (value) {
                        newCardState.setData(newNumber: value);
                      },
                    ),
                    WidgetMethods.verticalSpace(10),
                    TextFormField(
                      controller: this.cardExpiryDateController,
                      textInputAction: TextInputAction.done, 
                      decoration: InputDecoration(
                        labelText: 'Card Expiry',
                        labelStyle: TextStyle(color: Color(0x77737876)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0x77737876)),
                        ),
                      ),
                      onChanged: (value) {
                        newCardState.setData(newExpryDate: value);
                      },
                    ),
                    WidgetMethods.verticalSpace(10),
                    TextFormField(
                      controller: this.cardCvvController,
                      textInputAction: TextInputAction.done, 
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        labelStyle: TextStyle(color: Color(0x77737876)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0x77737876)),
                        ),
                      ),
                      onChanged: (value) {
                        newCardState.setData(newCVV: value);
                      },
                    ), 
                    ElevatedButton(
                      onPressed: () {
                        newCardState.flipCard();
                      }, 
                      child: const Text("dfs")
                    )
                  ] 
                );
              }, 
            ), 
          ],
        )
      )
    ); 
  }
}