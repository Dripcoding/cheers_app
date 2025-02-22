import 'package:flutter/material.dart';
import 'package:cheers_app/constants.dart';
import 'package:cheers_app/pages/search/search.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/BreweriesState.dart';

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
          ROUTES.SEARCH.path: (context) => SearchPage(),
        },
      ),
    );
  }
}
