import 'package:cheers_app/IdentifierFieldsState.dart';
import 'package:cheers_app/pages/search/components/sort_fields.dart';
import 'package:cheers_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/constants/inputs.dart';
import 'package:cheers_app/openBreweryService.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/SortFieldsState.dart';
import 'package:http/http.dart' as http;

class AddressRow extends StatefulWidget {
  final Map<InputNames, TextEditingController> controllers;
  const AddressRow({
    super.key = const Key('address_row'),
    required this.controllers,
  });

  @override
  State<AddressRow> createState() => _AddressRowState();
}

class _AddressRowState extends State<AddressRow> {
  late FocusNode cityInputFocusNode;
  late FocusNode stateInputFocusNode;
  late FocusNode countryInputFocusNode;
  late FocusNode postalInputFocusNode;

  @override
  void initState() {
    super.initState();

    final breweriesState = Provider.of<BreweriesState>(context, listen: false);
    final identifierFieldsState = Provider.of<IdentifierFieldsState>(
      context,
      listen: false,
    );
    final sortFieldsState = Provider.of<SortFieldsState>(
      context,
      listen: false,
    );

    cityInputFocusNode = FocusNode();
    stateInputFocusNode = FocusNode();
    countryInputFocusNode = FocusNode();
    postalInputFocusNode = FocusNode();

    cityInputFocusNode.addListener(() async {
      if (!cityInputFocusNode.hasFocus) {
        final queryParams = getQueryParams(
          widget.controllers,
          identifierFieldsState,
          sortFieldsState,
        );

        final names = await OpenBreweryService.getBreweryNames(
          queryParams,
          http.Client(),
        );

        breweriesState.addBreweryNames(names);
      }
    });
  }

  @override
  void dispose() {
    cityInputFocusNode.dispose();
    stateInputFocusNode.dispose();
    countryInputFocusNode.dispose();
    postalInputFocusNode.dispose();
    super.dispose();
  }

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
            controller: widget.controllers[InputNames.city],
            key: const Key('city_input'),
            decoration: const InputDecoration(labelText: 'City'),
            focusNode: cityInputFocusNode,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: widget.controllers[InputNames.state],
            key: const Key('state_input'),
            decoration: const InputDecoration(labelText: 'State'),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: widget.controllers[InputNames.country],
            key: const Key('country_input'),
            decoration: const InputDecoration(labelText: 'Country'),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: widget.controllers[InputNames.postal],
            key: const Key('postal_input'),
            decoration: const InputDecoration(labelText: 'Postal'),
          ),
        ),
      ],
    );
  }
}
