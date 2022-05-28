import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:flutter/material.dart';

class ColorState with ChangeNotifier{
  final Map<Color, bool> _colorOptions = _init(ColorConsts.colorOptions);

  static Map<Color, bool> _init(List<Color> data) {
    Map<Color, bool> map = Map<Color, bool>();
    for (Color option in data) {
      map.putIfAbsent(option, () => false);
    }
    map[data[0]] = true;
    return map;
  }


  Map<Color, dynamic> get colors => _colorOptions;

  bool isSelected(Color color) => _colorOptions[color]!;

  void select(Color color) {
    _resetAll();
    _colorOptions[color] = true;

    notifyListeners();
  }

  void _resetAll() {
    _colorOptions.updateAll((key, value) => false);
  }

  Color? get selectedOption {
    for (Color color in _colorOptions.keys) {
      if (_colorOptions[color]!) {
        return color;
      }
    }
    return null;
  } 

}