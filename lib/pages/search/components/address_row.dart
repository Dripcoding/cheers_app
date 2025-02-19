import 'package:flutter/material.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({super.key = const Key('address_row')});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: TextFormField(
            key: const Key('city_input'),
            decoration: const InputDecoration(labelText: 'City'),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextFormField(
            key: const Key('state_input'),
            decoration: const InputDecoration(labelText: 'State'),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextFormField(
            key: const Key('country_input'),
            decoration: const InputDecoration(labelText: 'Country'),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextFormField(
            key: const Key('postal_input'),
            decoration: const InputDecoration(labelText: 'Postal'),
          ),
        ),
      ],
    );
  }
}
