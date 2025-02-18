import 'package:flutter/material.dart';

class SettingsManager extends ChangeNotifier {

  double _tOffset = 0.0;

  double get tOffset => _tOffset;

  set tOffset(double tOffset) {
    _tOffset = tOffset;
    notifyListeners();
  }

}