import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/utils/helpers/payment_method.dart'; 

class PaymentMethods {

  PaymentMethods._(); 

  static final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(cardType: Strings.applePay, cardNumber: "1021321003578420", cardHolder: "Holder1", expireDate: "02/26", isSelected: true),
    PaymentMethod(cardType: Strings.masterCard, cardNumber: "3020146507384085", cardHolder: "Holder2", expireDate: "03/26", isSelected: false),
    PaymentMethod(cardType: Strings.vPay, cardNumber: "1021321003578420", cardHolder: "Holder3", expireDate: "04/26", isSelected: false),
  ]; 

  static List<PaymentMethod> get paymentMethods => _paymentMethods;

}