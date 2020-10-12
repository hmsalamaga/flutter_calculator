import 'package:calculator/src/core/color_data.dart';
import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  List<MaterialColor> _colorList = colorData;
  MaterialColor _currentColor;
  List<MaterialColor> get colorList => [..._colorList];
  MaterialColor get currentColor => _currentColor;

  void handleColor(MaterialColor selectedColor) async {
    _currentColor = selectedColor;
    notifyListeners();
  }
}
