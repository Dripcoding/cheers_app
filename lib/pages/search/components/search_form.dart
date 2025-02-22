import 'package:flutter/material.dart';
import 'address_row.dart';
import 'identifier_fields.dart';
import 'sort_fields.dart';

class SearchForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const SearchForm({super.key, required this.formKey});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1920, maxHeight: 1200),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: const AddressRow()),
            Expanded(
              child: const Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [IdentifierFields(), SortFields()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
