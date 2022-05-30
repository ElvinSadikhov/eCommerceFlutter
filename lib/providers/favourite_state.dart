import 'package:e_commerce_app/data/products.dart';
import 'package:e_commerce_app/data/strings.dart';
import 'package:e_commerce_app/utils/helpers/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteState with ChangeNotifier {
  final List<Product> _favourites = [];

  bool isFavourite(Product product) => _favourites.contains(product);

  void changeState(Product product) {
    isFavourite(product) ? _favourites.remove(product) : _favourites.add(product);
 
    notifyListeners();
  }
 
  List get favoutires => _favourites; 

  
  // final GetStorage _localStorage = GetStorage(Strings.favouriteProducts);

  // List<Product> _getData() {
  //   return List<Product>.from(_localStorage.read(Strings.favouriteProducts) ?? []);
  //   // return _localStorage.read(Strings.favouriteProducts).cast<Product>() ?? [];
  // }

  // void _setData(List<Product> favourites) {
  //   _localStorage.write(Strings.favouriteProducts, favourites);
  // }

  // bool isFavourite(Product product) => _getData().contains(product);

  // void changeState(Product product) { 
  //   List<Product> temp = _getData();

  //   if (isFavourite(product)) {
  //     temp.remove(product);
  //   } else {
  //     temp.add(product);
  //   } 

  //   _setData(temp);
 
  //   notifyListeners();
  // }
 
  // List get favoutires => _getData(); 
 
}