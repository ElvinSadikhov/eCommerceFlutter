import 'package:e_commerce_app/data/strings.dart'; 
import 'package:e_commerce_app/utils/helpers/purchase.dart';
import 'package:flutter/cupertino.dart';

class CartState with ChangeNotifier {
  final List<Purchase> _purchases = [];

  void addToCart(Purchase purchase) {
    _purchases.contains(purchase)  
      ? _purchases[_purchases.indexOf(purchase)] = _purchases[_purchases.indexOf(purchase)].incrementCount() 
        : _purchases.add(purchase);
    notifyListeners();

    for (Purchase purchase in _purchases) {
      debugPrint("${purchase.product} ${purchase.size} ${purchase.color} ${purchase.count}");
    } 
  }

  void removeFromCart(Purchase purchase) {
    _purchases[_purchases.indexOf(purchase)].count > 1
      ? _purchases[_purchases.indexOf(purchase)] = _purchases[_purchases.indexOf(purchase)].decrementCount()
        : _purchases.remove(purchase);
    notifyListeners();
  } 

  void removePurchase(Purchase purchase) {  
    _purchases.remove(purchase);
      
    notifyListeners();
  }

  String getTotalPrice() {
    double sum = 0;

    for (Purchase purchase in _purchases) {
      sum += double.parse(purchase.product.price.substring(2)) * purchase.count;
    }

    return "${Strings.euro} ${sum.toStringAsFixed(2)}";
  }
  
  List<Purchase> get purchases => _purchases; 
  
}
  