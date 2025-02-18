import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
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
      ),
    );
  }
}
