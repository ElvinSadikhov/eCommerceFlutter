import 'package:e_commerce_app/data/keys.dart';
import 'package:e_commerce_app/data/strings.dart'; 
import 'package:e_commerce_app/utils/helpers/purchase.dart';
import 'package:e_commerce_app/utils/helpers/purchase_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';


class CartState with ChangeNotifier {
  final GetStorage _localStorage = GetStorage(Keys.cart);

  PurchaseList _getData() {
    String? data = _localStorage.read(Keys.cart);
    return data != null ? PurchaseList.fromRawJson(data) : PurchaseList(purchases: []);
  }

  Future<void> _setData(PurchaseList purchases) async =>
    await _localStorage.write(Keys.cart, purchases.toRawJson());

  void addToCart(Purchase purchase) {
    List<Purchase> purchases = _getData().purchases;

    purchases.contains(purchase)  
      ? purchases[purchases.indexOf(purchase)] = purchases[purchases.indexOf(purchase)].incrementCount() 
        : purchases.add(purchase);
    
    _setData(PurchaseList(purchases: purchases));

    notifyListeners();
  }

  void removeFromCart(Purchase purchase) {
    List<Purchase> purchases = _getData().purchases;

    purchases[purchases.indexOf(purchase)].count > 1
      ? purchases[purchases.indexOf(purchase)] = purchases[purchases.indexOf(purchase)].decrementCount()
        : purchases.remove(purchase);

    _setData(PurchaseList(purchases: purchases));

    notifyListeners();
  }

  void removePurchase(Purchase purchase) {
    List<Purchase> purchases = _getData().purchases;

    purchases.remove(purchase);

    _setData(PurchaseList(purchases: purchases));

    notifyListeners();
  }

  String getTotalPrice() {
    List<Purchase> purchases = _getData().purchases;
    double sum = 0;

    for (Purchase purchase in purchases) {
      sum += double.parse(purchase.product.price.substring(2)) * purchase.count;
    }

    return "${Strings.euro} ${sum.toStringAsFixed(2)}";
  } 
  
  void resetState() {
    List<Purchase> purchases = _getData().purchases;
    purchases.clear();

    _setData(PurchaseList(purchases: purchases)); 

    notifyListeners(); 
  }

  List<Purchase> get purchases => _getData().purchases; 

}

// class CartState with ChangeNotifier {
//   final List<Purchase> _purchases = [];

//   void addToCart(Purchase purchase) {
//     // _purchases.indexWhere((element) => element.id == purchase.id);
//     _purchases.contains(purchase)  
//       ? _purchases[_purchases.indexOf(purchase)] = _purchases[_purchases.indexOf(purchase)].incrementCount() 
//         : _purchases.add(purchase);

//     notifyListeners(); 
//   }

//   void removeFromCart(Purchase purchase) {
//     _purchases[_purchases.indexOf(purchase)].count > 1
//       ? _purchases[_purchases.indexOf(purchase)] = _purchases[_purchases.indexOf(purchase)].decrementCount()
//         : _purchases.remove(purchase);

//     notifyListeners();
//   } 

//   void removePurchase(Purchase purchase) {  
//     _purchases.remove(purchase);
      
//     notifyListeners();
//   }

//   String getTotalPrice() {
//     double sum = 0;

//     for (Purchase purchase in _purchases) {
//       sum += double.parse(purchase.product.price.substring(2)) * purchase.count;
//     }

//     return "${Strings.euro} ${sum.toStringAsFixed(2)}";
//   }
  
//   List<Purchase> get purchases => _purchases; 


//   void resetState() {
//     _purchases.clear();
//   }
  
// }
  