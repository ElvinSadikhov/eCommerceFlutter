import 'package:e_commerce_app/consts/color_consts.dart'; 
import 'package:flutter/cupertino.dart';

class SizeState with ChangeNotifier {
  final Map<String, Map<String, Color>> _sizeOptions = {
    "S": {
      "boxColor": ColorConsts.orange,
      "textColor": ColorConsts.white
    },
    "M": {
      "boxColor": ColorConsts.white,
      "textColor": ColorConsts.black
    },
    "L": {
      "boxColor": ColorConsts.white,
      "textColor": ColorConsts.black
    },
    "XL": {
      "boxColor": ColorConsts.white,
      "textColor": ColorConsts.black
    },
    "XXL": {
      "boxColor": ColorConsts.white,
      "textColor": ColorConsts.black
    },
  };

  Map get options => _sizeOptions;

  void changeColor(String option) {
    _resetAll(); 
    _sizeOptions[option]!["boxColor"] = ColorConsts.orange;
    _sizeOptions[option]!["textColor"] = ColorConsts.white;

    notifyListeners();
  }

  void _resetAll() {  
    for (String option in _sizeOptions.keys) { 
      _sizeOptions[option]!["boxColor"] = ColorConsts.white;
      _sizeOptions[option]!["textColor"] = ColorConsts.black;
    }
  } 

  String? get selectedOption {
    for (String size in _sizeOptions.keys) { 
      if (_sizeOptions[size]!["boxColor"] == ColorConsts.orange) {
        return size;
      }
    }
    return null;
  }
}
 