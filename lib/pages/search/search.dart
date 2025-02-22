import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:cheers_app/pages/search/components/search_form.dart';
import 'package:cheers_app/openBreweryService.dart';
import 'package:cheers_app/BreweriesState.dart';

class SearchPage extends StatelessWidget {
  final http.Client _httpClient = http.Client();

  SearchPage({super.key = const Key('search_page')});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final breweriesState = Provider.of<BreweriesState>(context, listen: false);

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
                Expanded(child: SearchForm(key: Key('search_form'))),
                FilledButton(
                  key: const Key('search_brewery_button'),
                  onPressed: () async {
                    final breweries = await OpenBreweryService.getBreweries(
                      null,
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
