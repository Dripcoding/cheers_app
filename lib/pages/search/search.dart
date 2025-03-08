import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:cheers_app/pages/search/components/search_form.dart';
import 'package:cheers_app/openBreweryService.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/constants/inputs.dart';
import 'package:cheers_app/constants.dart';
import 'package:cheers_app/IdentifierFieldsState.dart';
import 'package:cheers_app/SortFieldsState.dart';
import 'package:cheers_app/utils/utils.dart';

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

  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _addressControllers = {
      InputNames.city: _cityInputController,
      InputNames.state: _stateInputController,
      InputNames.country: _countryInputController,
      InputNames.postal: _postalInputController,
    };

    _cityInputController.addListener(_checkFormValidity);
    _stateInputController.addListener(_checkFormValidity);
    _countryInputController.addListener(_checkFormValidity);
    _postalInputController.addListener(_checkFormValidity);

    _checkFormValidity();
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

  void _checkFormValidity() {
    setState(() {
      _isFormValid =
          _cityInputController.text.isNotEmpty ||
          _stateInputController.text.isNotEmpty ||
          _countryInputController.text.isNotEmpty ||
          _postalInputController.text.isNotEmpty;
    });
  }

  void _clearFormInputs() {
    _cityInputController.clear();
    _stateInputController.clear();
    _countryInputController.clear();
    _postalInputController.clear();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      key: const Key('search_brewery_button'),
                      onPressed:
                          _isFormValid
                              ? () async {
                                final queryParams = getQueryParams(
                                  _addressControllers,
                                  identifierState,
                                  sortState,
                                );

                                final breweries =
                                    await OpenBreweryService.getBreweries(
                                      queryParams,
                                      _httpClient,
                                    );
                                breweriesState.addBreweries(breweries);

                                if (context.mounted) {
                                  Navigator.pushNamed(
                                    context,
                                    ROUTES.LIST.path,
                                  );
                                }
                              }
                              : null,
                      child: const Text("Find your brewery"),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton(
                      key: const Key('clear_form_button'),
                      onPressed: _clearFormInputs,
                      child: const Text("Clear"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
