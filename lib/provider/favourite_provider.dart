import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void setListValue(int index) {
    _selectedItem.add(index);

    notifyListeners();
  }

  void removeListValue(int index) {
    _selectedItem.remove(index);

    notifyListeners();
  }
}
