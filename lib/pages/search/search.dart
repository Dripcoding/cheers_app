import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:cheers_app/pages/search/components/search_form.dart';
import 'package:cheers_app/openBreweryService.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/constants/inputs.dart';
import 'package:cheers_app/IdentifierFieldsState.dart';
import 'package:cheers_app/SortFieldsState.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key = const Key('search_page')});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final http.Client _httpClient = http.Client();

  final formKey = GlobalKey<FormState>();

  final TextEditingController _cityInputController = TextEditingController();
  final TextEditingController _stateInputController = TextEditingController();
  final TextEditingController _countryInputController = TextEditingController();
  final TextEditingController _postalInputController = TextEditingController();

  late final Map<InputNames, TextEditingController> _addressControllers;

  @override
  void initState() {
    super.initState();
    _addressControllers = {
      InputNames.city: _cityInputController,
      InputNames.state: _stateInputController,
      InputNames.country: _countryInputController,
      InputNames.postal: _postalInputController,
    };
  }

  @override
  void dispose() {
    _httpClient.close();
    _cityInputController.dispose();
    _stateInputController.dispose();
    _countryInputController.dispose();
    _postalInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final breweriesState = Provider.of<BreweriesState>(context, listen: false);
    final identifierState = Provider.of<IdentifierFieldsState>(
      context,
      listen: false,
    );
    final sortState = Provider.of<SortFieldsState>(context, listen: false);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1920, maxHeight: 1200),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 60, 40, 60),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SearchForm(
                    key: const Key('search_form'),
                    addressControllers: _addressControllers,
                  ),
                ),
                FilledButton(
                  key: const Key('search_brewery_button'),
                  onPressed: () async {
                    final queryParams = <String, String>{
                      ..._addressControllers.map(
                        (key, controller) =>
                            MapEntry(key.name, controller.text),
                      ),
                      if (identifierState.selectedType != null &&
                          identifierState.selectedType!.isNotEmpty)
                        InputNames.type.name: identifierState.selectedType!,
                      if (identifierState.selectedName != null &&
                          identifierState.selectedName!.isNotEmpty)
                        InputNames.breweryName.name:
                            identifierState.selectedName!,
                      if (sortState.sortOrder != null &&
                          sortState.sortOrder!.isNotEmpty)
                        InputNames.sort.name: sortState.sortOrder!,
                      if (sortState.numberOfBreweries.isNotEmpty)
                        InputNames.numberOfBreweries.name:
                            sortState.numberOfBreweries,
                    };

                    final breweries = await OpenBreweryService.getBreweries(
                      queryParams,
                      _httpClient,
                    );
                    breweriesState.addBreweries(breweries);
                  },
                  child: const Text("Find your brewery"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
