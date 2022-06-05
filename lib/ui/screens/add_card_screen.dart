// ignore_for_file: unnecessary_this

import 'package:awesome_card/awesome_card.dart';
import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/padding_consts.dart';
import 'package:e_commerce_app/data/payment_methods.dart'; 
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/providers/new_card_state.dart';
import 'package:e_commerce_app/providers/payment_state.dart';
import 'package:e_commerce_app/ui/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/ui/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/utils/helpers/payment_method.dart';
import 'package:e_commerce_app/utils/helpers/validator.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_cvc_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_expiration_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_number_input_formatter.dart';
import 'package:provider/provider.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({ Key? key }) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> { 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryDateController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController cardCvvController = TextEditingController();

  late final FocusNode _cvvFocusNode;

  @override
  void initState() {
    super.initState();
    _cvvFocusNode = FocusNode();
    _cvvFocusNode.addListener(_onOnFocusNodeEvent);
  }

  void _onOnFocusNodeEvent() {
    Provider.of<NewCardState>(context, listen: false).setData(isCvvFieldOnFocus: _cvvFocusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size; 

    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.fromLTRB(PaddingConsts.kDefaultHorizontalPadding, sizeOfScreen.width * 0.16, PaddingConsts.kDefaultHorizontalPadding, 0),
          child: Column(
            children: [
              const CustomAppBar(rightSideIcon: Icons.more_vert, label: Strings.addNewCard),
              WidgetMethods.verticalSpace(25),
              Consumer<NewCardState>(
                builder: (context, NewCardState newCardState, _) {
                  return Form(
                    key: this._formKey,
                    child: Column(
                      children: [
                        CreditCard(
                          cardNumber: newCardState.number,
                          cardExpiry: newCardState.expryDate,
                          cardHolderName: newCardState.holderName,
                          cvv: newCardState.cvv,
                          bankName: Strings.fastacy,
                          // cardType: CardType.masterCard,   
                          showBackSide: newCardState.isOnBackSide,  
                          frontBackground: CardBackgrounds.black,
                          backBackground: CardBackgrounds.white,
                          showShadow: true,
                          textExpDate: 'Exp. Date',
                          textName: 'Name Surname',
                          textExpiry: 'MM/YY'
                        ), 
                        WidgetMethods.verticalSpace(25), 
                        CustomTextFormField.getFormField(
                          controller: this.cardHolderController,  
                          validator: (value) => Validator.validateHolderName(value), 
                          labelText: Strings.cardHolder, 
                          onChanged: (value) {
                            newCardState.setData(newHolderName: value);
                          }
                        ),
                        WidgetMethods.verticalSpace(10), 
                        CustomTextFormField.getFormField(
                          controller: this.cardNumberController,  
                          validator: (value) => Validator.validateCardNumber(value), 
                          labelText: Strings.cardNumber,  
                          keyboardType: TextInputType.number,
                          inputFormatters: [ 
                            LengthLimitingTextInputFormatter(16),
                            CreditCardNumberInputFormatter(
                              onCardSystemSelected: (value) {
                                newCardState.determineCardType(value);
                              },
                            ) 
                          ],
                          onChanged: (value) {
                            newCardState.setData(newNumber: value);
                          }
                        ),
                        WidgetMethods.verticalSpace(10),
                        CustomTextFormField.getFormField(
                          controller: this.cardExpiryDateController,  
                          validator: (value) => Validator.validateExpryDate(value), 
                          labelText: Strings.cardExpry, 
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            CreditCardExpirationDateFormatter()
                          ],
                          onChanged: (value) {
                            newCardState.setData(newExpryDate: value);
                          } 
                        ),
                        WidgetMethods.verticalSpace(10),
                        CustomTextFormField.getFormField(
                          controller: this.cardCvvController, 
                          textInputAction: TextInputAction.done, 
                          focusNode: this._cvvFocusNode,
                          validator: (value) => Validator.validateCVV(value), 
                          labelText: Strings.cvv, 
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            CreditCardCvcInputFormatter()
                          ],
                          onChanged: (value) {
                            newCardState.setData(newCVV: value);
                          }
                        ), 
                        WidgetMethods.verticalSpace(10),
                        ElevatedButton( 
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(ColorConsts.black)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<PaymentState>(context, listen: false).addPaymentMethod(PaymentMethod(cardType: newCardState.type, cardNumber: newCardState.number, cardHolder: newCardState.holderName, expireDate: newCardState.expryDate, isSelected: false));
                              newCardState.resetAll();
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You successfully added card!")));
                            } 
                          }, 
                          child: const Text("Add New Card")
                        )
                      ] 
                    ),
                  );
                }, 
              ), 
            ],
          )
        ),
      )
    ); 
  }
}