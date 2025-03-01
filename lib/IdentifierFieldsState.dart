// ignore: file_names
import 'package:flutter/material.dart';

class IdentifierFieldsState extends ChangeNotifier {
  String? selectedType;
  String? selectedName;

  void setSelectedType(String value) {
    selectedType = value;
    notifyListeners();
  }

  void setSelectedName(String value) {
    selectedName = value;
    notifyListeners();
  }
}
