// ignore_for_file: unnecessary_this

import 'package:awesome_card/awesome_card.dart';
import 'package:e_commerce_app/data/image_resources.dart';
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
        return ImageResources.applePayLogoAsset; 
      case Strings.masterCard:
        return ImageResources.masterCardLogoAsset;
      case Strings.vPay:
        return ImageResources.vPayLogoAsset; 
      default:
        return ImageResources.masterCardLogoAsset;
    }
  }
} 
  