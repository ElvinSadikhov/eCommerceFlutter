// ignore_for_file: prefer_collection_literals

import 'package:e_commerce_app/data/data_sets.dart';
import 'package:e_commerce_app/data/strings.dart'; 
import 'package:flutter/cupertino.dart';

class CategoryState with ChangeNotifier {
  final Map<String, bool> _categoryOptions = _init(DataSets.categoryOptions);
  
  static Map<String, bool> _init(List<String> data) {
    Map<String, bool> map = Map<String, bool>();
    for (String option in data) {
      map.putIfAbsent(option, () => false);
    }
    map[data[0]] = true;
    return map;
  } 


  Map get options => _categoryOptions;

  void chooseOption(String option) {
    _resetAll();  
    _categoryOptions[option] = true;

    notifyListeners();
  }

  void _resetAll() { 
    _categoryOptions.updateAll((key, value) => false);
  }

}
 