// ignore_for_file: unnecessary_this

import 'package:awesome_card/extra/card_type.dart';
import 'package:flutter/cupertino.dart'; 


class NewCardState with ChangeNotifier {
  String _holderName = "";
  CardType? _type;
  String _number = "";
  String _expryDate = "";
  String _cvv = "";
  bool _isOnBackSide = false;

  void setData({String? newHolderName, CardType? newType, String? newNumber, String? newExpryDate, String? newCVV}) {
    if (newHolderName != null) {
      this._holderName = newHolderName;
    }
    if (newType != null) {
      this._type = newType;
    }
    if (newNumber != null) {
      this._number = newNumber;
    }
    if (newExpryDate != null) {
      this._expryDate = newExpryDate;
    }
    if (newCVV != null) {
      this._cvv = newCVV;
    }

    notifyListeners();
  }

  void flipCard() {
    this._isOnBackSide = !this._isOnBackSide; 

    notifyListeners();
  }

  String get holderName => _holderName;
  CardType? get type => _type;
  String get number => _number;
  String get expryDate => _expryDate;
  String get cvv => _cvv; 
  bool get isOnBackSide => _isOnBackSide;
  
}