// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/data/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_number_input_formatter.dart'; 


class NewCardState with ChangeNotifier {
  String _holderName = "";
  String _type = Strings.masterCard;
  String _number = "";
  String _expryDate = "";
  String _cvv = "";
  bool _isOnBackSide = false;
  bool _isCvvFieldOnFocus = false;

  void setData({
    String? newHolderName, 
    String? newType, 
    String? newNumber, 
    String? newExpryDate, 
    String? newCVV,
    bool? isCvvFieldOnFocus}) {
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
      if (isCvvFieldOnFocus != null) {
        this._isCvvFieldOnFocus = isCvvFieldOnFocus;
      }

      this._isOnBackSide = this._isCvvFieldOnFocus ? true : false;

      notifyListeners();
  }
  
  void determineCardType(CardSystemData? value) {
    if(value?.system != null){
      switch (value!.system) { 
        case 'Mastercard':
          this.setData(newType: Strings.masterCard);
          break;
      } 
    } 
  }

  // void flipCard() {
  //   this._isOnBackSide = !this._isOnBackSide; 

  //   notifyListeners();
  // } 

  void resetAll() {
    this._holderName = "";
    this._type = Strings.masterCard;
    this._number = "";
    this._expryDate = "";
    this._cvv = "";
    this._isOnBackSide = false;
    this._isCvvFieldOnFocus = false;
  }


  String get holderName => _holderName;
  String get type => _type;
  String get number => _number;
  String get expryDate => _expryDate;
  String get cvv => _cvv; 
  bool get isOnBackSide => _isOnBackSide;
  bool get isCvvFieldOnFocus => _isCvvFieldOnFocus;
  
}