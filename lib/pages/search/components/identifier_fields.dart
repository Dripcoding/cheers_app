import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/IdentifierFieldsState.dart';

class IdentifierFields extends StatelessWidget {
  const IdentifierFields({super.key = const Key('identifier_inputs')});

  @override
  Widget build(BuildContext context) {
    return Consumer<IdentifierFieldsState>(
      builder: (context, state, child) {
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
                items:
                    ['Type1', 'Type2', 'Type3']
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
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
                items:
                    ['Name1', 'Name2', 'Name3']
                        .map(
                          (name) =>
                              DropdownMenuItem(value: name, child: Text(name)),
                        )
                        .toList(),
                onChanged: (value) {
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
