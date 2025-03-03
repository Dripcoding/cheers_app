import 'package:cheers_app/pages/list/list.dart';
import 'package:flutter/material.dart';
import 'package:cheers_app/constants.dart';
import 'package:cheers_app/pages/search/search.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/IdentifierFieldsState.dart';
import 'package:cheers_app/SortFieldsState.dart';
import 'package:cheers_app/pages/brewery/brewery_details.dart';
import 'package:cheers_app/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(Theme.of(context).textTheme);

    return ChangeNotifierProvider(
      create: (context) => BreweriesState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cheers App',
        theme: materialTheme.light(),
        darkTheme: materialTheme.dark(),
        themeMode: ThemeMode.system,
        initialRoute: ROUTES.SEARCH.path,
        routes: {
          ROUTES.HOME.path:
              (context) => const Scaffold(body: Center(child: Text('Home'))),
          ROUTES.SEARCH.path:
              (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (_) => IdentifierFieldsState(),
                  ),
                  ChangeNotifierProvider(create: (_) => SortFieldsState()),
                ],
                child: SearchPage(),
              ),
          ROUTES.LIST.path: (context) => const ListPage(),
          ROUTES.DETAILS.path: (context) => const BreweryDetailsPage(),
        },
      ),
    );
  }
}
