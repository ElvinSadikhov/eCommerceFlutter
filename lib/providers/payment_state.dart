import 'package:e_commerce_app/data/payment_methods.dart';
import 'package:e_commerce_app/utils/helpers/payment_method.dart'; 
import 'package:flutter/cupertino.dart';

class PaymentState with ChangeNotifier {
  final List<PaymentMethod> _paymentMethods = List.from(PaymentMethods.paymentMethods);
 
  bool isSelected(PaymentMethod paymentMethod) {
    return _paymentMethods[_paymentMethods.indexOf(paymentMethod)].isSelected;
  }

  void select(PaymentMethod paymentMethod) {
    _resetAll();
    _paymentMethods[_paymentMethods.indexOf(paymentMethod)].isSelected = true;

    notifyListeners();
  }

  void _resetAll() {
    for (var element in _paymentMethods) {
      element.isSelected = false;
    }
  }

  void addPaymentMethod(PaymentMethod paymentMethod) {
    _paymentMethods.add(paymentMethod);

    notifyListeners();
  }
 
  List<PaymentMethod> get paymentMethods => _paymentMethods; 
  
}

