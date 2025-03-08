import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/IdentifierFieldsState.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/constants.dart';

class IdentifierFields extends StatelessWidget {
  const IdentifierFields({super.key = const Key('identifier_inputs')});

  List<DropdownMenuItem<String>> getBreweryNameMenuItems(
    List<String> breweryNames,
  ) {
    return breweryNames
        .map((name) => DropdownMenuItem(value: name, child: Text(name)))
        .toList();
  }

  List<DropdownMenuItem<String>> getBreweryTypeMenuItems() {
    return BreweryTypesExtension.types
        .map((type) => DropdownMenuItem(value: type, child: Text(type)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IdentifierFieldsState>(
      builder: (context, state, child) {
        final breweryNames = Provider.of<BreweriesState>(context).breweryNames;
        // todo: add none as an menu item to indicate no selection
        final breweryNameItems = getBreweryNameMenuItems(breweryNames);
        final breweryTypeItems = getBreweryTypeMenuItems();

        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 68),
            SizedBox(
              width: 200,
              child: DropdownButtonFormField<String>(
                key: const Key('by_type_input'),
                decoration: const InputDecoration(labelText: 'Type'),
                value: state.selectedType,
                items: breweryTypeItems,
                onChanged: (value) {
                  if (value != null) {
                    state.setSelectedType(value);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: DropdownButtonFormField<String>(
                key: const Key('by_name_input'),
                decoration: const InputDecoration(labelText: 'Name'),
                value: state.selectedName,
                isExpanded: true,
                items: breweryNameItems,
                onChanged:
                    breweryNameItems.isEmpty
                        ? null
                        : (value) {
                          if (value != null) {
                            state.setSelectedName(value);
                          }
                        },
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
