import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/utils/helpers/payment_method.dart'; 

class PaymentMethods {

  PaymentMethods._(); 

  static final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(cardType: Strings.applePay, cardNumber: Strings.cardNumber1, cardHolder: "Holder1", expireDate: Strings.expireDate1, isSelected: true),
    PaymentMethod(cardType: Strings.masterCard, cardNumber: Strings.cardNumber2, cardHolder: "Holder2", expireDate: Strings.expireDate1, isSelected: false),
    PaymentMethod(cardType: Strings.vPay, cardNumber: Strings.cardNumber3, cardHolder: "Holder3", expireDate: Strings.expireDate1, isSelected: false),
  ]; 

  static List<PaymentMethod> get paymentMethods => _paymentMethods;

}