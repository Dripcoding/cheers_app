import 'dart:collection';
import 'package:cheers_app/models/brewery.dart';
import 'package:flutter/material.dart';

class BreweriesState extends ChangeNotifier {
  List<Brewery> breweries = [];

  UnmodifiableListView<Brewery> get breweriesList =>
      UnmodifiableListView(breweries);

  void addBreweries(List<Brewery> newBreweries) {
    breweries.addAll(newBreweries);
    notifyListeners();
  }
}
