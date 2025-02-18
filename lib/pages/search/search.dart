import 'package:flutter/material.dart';
import 'package:cheers_app/pages/search/components/search_form.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key = const Key('search_page')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1920),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: const SearchForm(key: Key('search_form')),
          ),
        ),
      ),
    );
  }
}
