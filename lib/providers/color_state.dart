import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:flutter/material.dart';

class ColorState with ChangeNotifier{
  final Map<Color, dynamic> _colors = {
    ColorConsts.white: true,
    ColorConsts.black: false,
    ColorConsts.indigo: false,
    ColorConsts.purple: false,
    ColorConsts.lightGreen: false,
    ColorConsts.brown: false,
    ColorConsts.red: false,
  };

  Map<Color, dynamic> get colors => _colors;

  bool isSelected(Color color) => _colors[color];

  void select(Color color) {
    _resetAll();
    _colors[color] = true;

    notifyListeners();
  }

  void _resetAll() {
    _colors.updateAll((key, value) => false);
  }

  Color? get selectedOption {
    for (Color color in _colors.keys) {
      if (_colors[color]) {
        return color;
      }
    }
    return null;
  }

}