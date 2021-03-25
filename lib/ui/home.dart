import 'package:flutter/material.dart';
import 'package:loga/shared/models/truck.dart';
import 'package:loga/shared/models/vacancy.dart';
import 'package:loga/shared/providers/vacancies.dart';
import 'package:loga/ui/widgets/default_drawer.dart';
import 'package:loga/ui/widgets/vacancy_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: AppBar(
        title: Text("Loga"),
      ),
      body: Consumer<Vacancies>(
        builder: (context, vacancyController, widget) {
          return Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                child: Text(
                  "Vagas",
                  style: TextStyle(fontSize: 24),
                ),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4),
                    itemCount: vacancyController.vacancies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return VacancyWidget(
                          vacancy: vacancyController.vacancies[index]);
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
