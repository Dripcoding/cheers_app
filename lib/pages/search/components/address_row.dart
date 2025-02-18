import 'package:flutter/material.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({super.key = const Key('address_row')});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            key: const Key('city_input'),
            decoration: const InputDecoration(labelText: 'City'),
          ),
        ),
        Expanded(
          child: TextFormField(
            key: const Key('state_input'),
            decoration: const InputDecoration(labelText: 'State'),
          ),
        ),
        Expanded(
          child: TextFormField(
            key: const Key('country_input'),
            decoration: const InputDecoration(labelText: 'Country'),
          ),
        ),
        Expanded(
          child: TextFormField(
            key: const Key('postal_input'),
            decoration: const InputDecoration(labelText: 'Postal'),
          ),
        ),
      ],
    );
  }
}
