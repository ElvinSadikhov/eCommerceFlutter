// ignore_for_file: prefer_collection_literals

import 'package:e_commerce_app/data/data_sets.dart'; 
import 'package:flutter/cupertino.dart';

class SizeState with ChangeNotifier {
  final Map<String, bool> _sizeOptions = _init(DataSets.sizeOptions);

  static Map<String, bool> _init(List<String> data) {
    Map<String, bool> map = Map<String, bool>();
    for (String option in data) {
      map.putIfAbsent(option, () => false);
    }
    map[data[0]] = true;
    return map;
  }

  Map get options => _sizeOptions;

  void chooseOption(String option) {
    _resetAll(); 
    _sizeOptions[option] = true;

    notifyListeners();
  }

  void _resetAll() {  
    _sizeOptions.updateAll((key, value) => false);
  } 

  String? get selectedOption {
    for (String size in _sizeOptions.keys) { 
      if (_sizeOptions[size]!) {
        return size;
      }
    }
    return null;
  }

  
}
 