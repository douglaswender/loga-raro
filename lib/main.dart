import 'package:flutter/material.dart';
import 'package:loga/shared/providers/vacancies.dart';
import 'package:loga/ui/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Vacancies(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loga',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
