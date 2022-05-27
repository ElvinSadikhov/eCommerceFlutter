import 'package:e_commerce_app/consts/color_consts.dart'; 
import 'package:flutter/cupertino.dart';

class CategoryState with ChangeNotifier {
  final Map<String, Map<String, Color>> _categoryOptions = {
    "All": {
      "boxColor": ColorConsts.black,
      "textColor": ColorConsts.white
    },
    "Winter": {
      "boxColor": ColorConsts.white,
      "textColor": ColorConsts.black
    },
    "Women": {
      "boxColor": ColorConsts.white,
      "textColor": ColorConsts.black
    },
    "Eyewear": {
      "boxColor": ColorConsts.white,
      "textColor": ColorConsts.black
    },
  };

  Map get categoryOptions => _categoryOptions;

  void changeColor(String option) {
    _resetAll(); 
    _categoryOptions[option]!["boxColor"] = ColorConsts.black;
    _categoryOptions[option]!["textColor"] = ColorConsts.white;

    notifyListeners();
  }

  void _resetAll() { 
    for (String option in _categoryOptions.keys) {
      debugPrint(option); 
      _categoryOptions[option]!["boxColor"] = ColorConsts.white;
      _categoryOptions[option]!["textColor"] = ColorConsts.black;
    }
  } 
}
 