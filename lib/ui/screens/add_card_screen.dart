import 'package:e_commerce_app/consts/padding_consts.dart'; 
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter_credit_card/credit_card_brand.dart'; 
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter/material.dart';


class AddCardScreen extends StatefulWidget {
  
  const AddCardScreen({ Key? key }) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size; 

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(PaddingConsts.kDefaultHorizontalPadding, sizeOfScreen.width * 0.16, PaddingConsts.kDefaultHorizontalPadding, 0),
        child: Column(  
          children: [
            const CustomAppBar(rightSideIcon: Icons.more_vert, label: Strings.addNewCard),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,  
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        themeColor: Colors.blue,
                        formKey: formKey,
                        cardNumberDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Number',
                          hintText: 'xxxx xxxx xxxx xxxx'
                        ),
                        expiryDateDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'xx/xx'
                        ),
                        cvvCodeDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'xxx'
                        ),
                        cardHolderDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Holder',
                        ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: Color(0xff1b447b)

                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          child: const Text(
                            'validate',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          debugPrint('valid');
                        }
                        else{
                          debugPrint('inValid');
                        }
                      },
                    )
                  ],
                ),
              )
            ),  
          ]
        ),
      )
    ); 
    
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
 
 