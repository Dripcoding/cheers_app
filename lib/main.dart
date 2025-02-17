import 'package:flutter/material.dart';
import 'package:cheers_app/constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Hello World!'))),
      initialRoute: ROUTES.HOME.path,
      routes: {
        ROUTES.HOME.path:
            (context) => const Scaffold(body: Center(child: Text('Home'))),
        ROUTES.SEARCH.path:
            (context) => const Scaffold(body: Center(child: Text('Search'))),
      },
    );
  }
}
