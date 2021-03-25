import 'package:flutter/material.dart';
import 'package:loga/shared/models/vacancy.dart';

class VacancyPage extends StatelessWidget {
  final Vacancy vacancy;

  const VacancyPage({Key key, @required this.vacancy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Página da vaga ${vacancy.id}'),
      ),
    );
  }
}
