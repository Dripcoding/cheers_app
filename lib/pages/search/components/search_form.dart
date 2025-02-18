import 'package:flutter/material.dart';
import 'address_row.dart';
import 'identifier_fields.dart';

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
      child: Column(
        children: [
          const AddressRow(),
          Row(children: const [IdentifierFields()]),
        ],
      ),
    );
  }
}
