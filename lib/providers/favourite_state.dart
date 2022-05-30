import 'package:e_commerce_app/data/keys.dart'; 
import 'package:e_commerce_app/utils/helpers/product.dart';
import 'package:e_commerce_app/utils/helpers/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteState with ChangeNotifier { 
  final GetStorage _localStorage = GetStorage(Keys.favouriteProducts);

  ProductList _getData() {
    String? data = _localStorage.read(Keys.favouriteProducts); 
    return data != null ? ProductList.fromRawJson(data) : ProductList(products: []);
  } 

  Future<void> _setData(ProductList favourites) async =>
    await _localStorage.write(Keys.favouriteProducts, favourites.toRawJson()); 
  

  bool isFavourite(Product product) => _getData().products.contains(product);

  void changeState(Product product) { 
    List<Product> products = _getData().products;

    if (isFavourite(product)) {
      products.remove(product);
    } else {
      products.add(product);
    } 

    _setData(ProductList(products: products));
 
    notifyListeners();
  }
 
  List get favoutires => _getData().products; 
 
}

// class FavouriteState with ChangeNotifier {

//   final List<Product> _favourites = [];

//   bool isFavourite(Product product) => _favourites.contains(product);

//   void changeState(Product product) {
//     isFavourite(product) ? _favourites.remove(product) : _favourites.add(product);
 
//     notifyListeners();
//   }
 
//   List get favoutires => _favourites; 

// }