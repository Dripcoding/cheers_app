import 'package:flutter/material.dart';

class SortFieldsState extends ChangeNotifier {
  String? sortOrder;

  void setSortOrder(String value) {
    sortOrder = value;
    notifyListeners();
  }
}
