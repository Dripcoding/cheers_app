import 'package:flutter/material.dart';
import 'package:cheers_app/pages/search/components/search_form.dart';
import 'package:cheers_app/openBreweryService.dart'; // added import

class SearchPage extends StatelessWidget {
  const SearchPage({super.key = const Key('search_page')});

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
                const Expanded(child: SearchForm(key: Key('search_form'))),
                FilledButton(
                  key: const Key('search_brewery_button'),
                  onPressed: () async {
                    final response = await OpenBreweryService.getBreweries(
                      null,
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
