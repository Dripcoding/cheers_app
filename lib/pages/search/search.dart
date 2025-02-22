import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cheers_app/pages/search/components/search_form.dart';
import 'package:cheers_app/openBreweryService.dart';

class SearchPage extends StatelessWidget {
  final http.Client _httpClient = http.Client();

  SearchPage({super.key = const Key('search_page')});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                // Pass the global key to the SearchForm widget.
                Expanded(
                  child: SearchForm(key: Key('search_form'), formKey: formKey),
                ),
                FilledButton(
                  key: const Key('search_brewery_button'),
                  onPressed: () async {
                    // Retrieve the input values from the SearchForm state.

                    var state = formKey.currentState;
                    // var city = formKey.currentState.currentState?.fields['city']?.value;

                    final response = await OpenBreweryService.getBreweries(
                      null,
                      _httpClient,
                    );
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
