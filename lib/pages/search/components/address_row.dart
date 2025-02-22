import 'package:flutter/material.dart';
import 'package:cheers_app/constants/inputs.dart';

class AddressRow extends StatelessWidget {
  final Map<InputNames, TextEditingController> controllers;
  const AddressRow({
    super.key = const Key('address_row'),
    required this.controllers,
  });

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
            controller: controllers[InputNames.city],
            key: const Key('city_input'),
            decoration: const InputDecoration(labelText: 'City'),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: controllers[InputNames.state],
            key: const Key('state_input'),
            decoration: const InputDecoration(labelText: 'State'),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: controllers[InputNames.country],
            key: const Key('country_input'),
            decoration: const InputDecoration(labelText: 'Country'),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: controllers[InputNames.postal],
            key: const Key('postal_input'),
            decoration: const InputDecoration(labelText: 'Postal'),
          ),
        ),
      ],
    );
  }
}
