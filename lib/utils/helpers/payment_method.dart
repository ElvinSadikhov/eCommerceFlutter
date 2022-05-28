// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/data/strings.dart';

class PaymentMethod {
  final String cardType;
  final String cardNumber;
  final String cardHolder;
  final String expireDate;
  bool isSelected;

  PaymentMethod({
    required this.cardType, 
    required this.cardNumber, 
    required this.cardHolder, 
    required this.expireDate,
    required this.isSelected, 
    }); 
     
  String getSecuredCardNumber() {
    return "···· ···· ${this.cardNumber.substring(8, 12)} ${this.cardNumber.substring(12)}";
  }

  String getLogoAsset() { 
    switch (cardType) {
      case Strings.applePay:
        return Strings.applePayLogoAsset; 
      case Strings.masterCard:
        return Strings.masterCardLogoAsset;
      case Strings.vPay:
        return Strings.vPayLogoAsset; 
      default:
        return Strings.applePayLogoAsset;
    }
  }
} 
  