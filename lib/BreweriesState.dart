// ignore_for_file: file_names
import 'dart:collection';
import 'package:cheers_app/models/brewery.dart';
import 'package:flutter/material.dart';

class BreweriesState extends ChangeNotifier {
  List<Brewery> breweries = [];
  List<String> breweryNames = [];

  Brewery? activeBrewery;

  UnmodifiableListView<Brewery> get breweriesList =>
      UnmodifiableListView(breweries);

  void addBreweries(List<Brewery> newBreweries) {
    breweries.addAll(newBreweries);
    notifyListeners();
  }

  void addBreweryNames(List<String> names) {
    breweryNames = names;
    notifyListeners();
  }

  void setActiveBrewery(Brewery brewery) {
    activeBrewery = brewery;
    notifyListeners();
  }
}
