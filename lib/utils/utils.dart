import 'package:flutter/material.dart';
import 'package:cheers_app/constants/inputs.dart';
import 'package:cheers_app/IdentifierFieldsState.dart';
import 'package:cheers_app/SortFieldsState.dart';

Map<String, String> getQueryParams(
  Map<InputNames, TextEditingController> controllers,
  IdentifierFieldsState identifierState,
  SortFieldsState sortState,
) {
  final queryParams = <String, String>{
    ...controllers.map(
      (key, controller) => MapEntry(key.name, controller.text),
    ),
    if (identifierState.selectedType != null &&
        identifierState.selectedType!.isNotEmpty)
      InputNames.type.name: identifierState.selectedType!,
    if (identifierState.selectedName != null &&
        identifierState.selectedName!.isNotEmpty)
      InputNames.breweryName.name: identifierState.selectedName!,
    if (sortState.sortOrder != null && sortState.sortOrder!.isNotEmpty)
      InputNames.sort.name: sortState.sortOrder!,
    if (sortState.numberOfBreweries.isNotEmpty)
      InputNames.numberOfBreweries.name: sortState.numberOfBreweries,
  };

  return queryParams;
}
