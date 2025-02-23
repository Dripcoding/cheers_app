import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/SortFieldsState.dart';

class SortFields extends StatelessWidget {
  const SortFields({super.key = const Key('sort_fields')});

  @override
  Widget build(BuildContext context) {
    return Consumer<SortFieldsState>(
      builder: (context, state, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                key: const Key('number_input'),
                initialValue: state.numberOfBreweries,
                decoration: const InputDecoration(
                  labelText: 'Number of Breweries',
                ),
                onChanged: (value) {
                  state.setNumberOfBreweries(value);
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: Column(
                key: const Key('sort_order_input'),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Sort Order',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  RadioListTile<String>(
                    title: const Text('asc'),
                    value: 'asc',
                    groupValue: state.sortOrder,
                    onChanged: (value) {
                      if (value != null) {
                        state.setSortOrder(value);
                      }
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('desc'),
                    value: 'desc',
                    groupValue: state.sortOrder,
                    onChanged: (value) {
                      if (value != null) {
                        state.setSortOrder(value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
