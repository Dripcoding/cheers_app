import 'package:cheers_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/BreweriesState.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key = const Key('list_page')});

  @override
  Widget build(BuildContext context) {
    final breweriesState = Provider.of<BreweriesState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: const Key('back_button'),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, ROUTES.SEARCH.path);
          },
        ),
        title: const Text('Breweries List'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1920, maxHeight: 1200),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 60, 40, 60),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: breweriesState.breweries.length,
              itemBuilder: (context, index) {
                final brewery = breweriesState.breweries[index];
                return Card(
                  child: ListTile(
                    title: Text(brewery.name),
                    subtitle: Text(brewery.city),
                    trailing: Text(brewery.state),
                    onTap: () {
                      breweriesState.setActiveBrewery(brewery);

                      if (context.mounted) {
                        Navigator.pushNamed(context, ROUTES.DETAILS.path);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
