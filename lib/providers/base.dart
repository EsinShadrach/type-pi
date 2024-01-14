import 'package:flutter/material.dart';

class NavRailProvider extends ChangeNotifier {
  bool _isOpened = false;
  int _selectedIndex = 0;

  bool get isOpened => _isOpened;
  int get selectedIndex => _selectedIndex;

  void open() {
    _isOpened = !_isOpened;
    notifyListeners();
  }

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
