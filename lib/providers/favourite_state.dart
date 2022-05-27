import 'package:flutter/cupertino.dart';

class FavouriteState with ChangeNotifier {
  final List _favourites = [];

  bool isFavourite(Map product) => _favourites.contains(product);

  void changeState(Map product) {
    isFavourite(product) ? _favourites.remove(product) : _favourites.add(product);

    if (isFavourite(product)) debugPrint("It is there!");
    debugPrint(_favourites.toString());
    notifyListeners();
  }
 
  List get favoutires => _favourites; 

}