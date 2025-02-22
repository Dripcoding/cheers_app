import 'package:flutter/material.dart';
import 'address_row.dart';
import 'identifier_fields.dart';
import 'sort_fields.dart';
import 'package:cheers_app/constants/inputs.dart';

class SearchForm extends StatelessWidget {
  final Map<InputNames, TextEditingController> addressControllers;

  const SearchForm({
    super.key = const Key('search_form'),
    required this.addressControllers,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1920, maxHeight: 1200),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: AddressRow(controllers: addressControllers)),
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
