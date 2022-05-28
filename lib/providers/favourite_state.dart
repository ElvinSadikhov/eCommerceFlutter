import 'package:e_commerce_app/utils/helpers/product.dart';
import 'package:flutter/cupertino.dart';

class FavouriteState with ChangeNotifier {
  final List<Product> _favourites = [];

  bool isFavourite(Product product) => _favourites.contains(product);

  void changeState(Product product) {
    isFavourite(product) ? _favourites.remove(product) : _favourites.add(product);
 
    notifyListeners();
  }
 
  List get favoutires => _favourites; 

}