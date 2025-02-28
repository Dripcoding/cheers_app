import 'package:cheers_app/pages/list/list.dart';
import 'package:flutter/material.dart';
import 'package:cheers_app/constants.dart';
import 'package:cheers_app/pages/search/search.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/BreweriesState.dart';
import 'package:cheers_app/IdentifierFieldsState.dart';
import 'package:cheers_app/SortFieldsState.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BreweriesState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
        },
      ),
    );
  }
}
