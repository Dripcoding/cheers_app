// ignore: file_names
import 'package:flutter/material.dart';

class SortFieldsState extends ChangeNotifier {
  String? sortOrder;
  String numberOfBreweries = '';

  void setSortOrder(String value) {
    sortOrder = value;
    notifyListeners();
  }

  void setNumberOfBreweries(String value) {
    numberOfBreweries = value;
    notifyListeners();
  }
}
