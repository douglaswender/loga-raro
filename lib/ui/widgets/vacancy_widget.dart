import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loga/shared/models/vacancy.dart';
import 'package:loga/ui/vacancy_page.dart';

class VacancyWidget extends StatelessWidget {
  final Vacancy vacancy;

  VacancyWidget({Key key, @required this.vacancy});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        width: screenWidth / 4,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Vaga ${vacancy.id}"),
            SizedBox(
              height: 10,
            ),
            vacancy.disponivel
                ? Column(
                    children: [
                      Text('Disponível'),
                      SizedBox(
                        height: 10,
                      ),
                      vacancy.history.length > 0?
                      Text("Saiu: ${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(vacancy.history.last.horarioSaida))}", textAlign: TextAlign.center,) :
                          Text("Ninguém estacionou aqui!", textAlign: TextAlign.center,)
                    ],
                  )
                : Column(
                    children: [
                      Text('Ocupada'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Veículo: ${vacancy.history.last.id}'),
                      SizedBox(
                        height: 10,
                      ),
                      vacancy.history.length >0 ?
                      Text("Chegou: ${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(vacancy.history.last.horarioEntrada))}", textAlign: TextAlign.center,):
                          Text("Ninguém passou  aqui!", textAlign: TextAlign.center,)
                    ],
                  ),
          ],
        )),
        decoration: BoxDecoration(
            color: vacancy.disponivel ? Colors.green[800] : Colors.red[800],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      onTap: ()=>{
        Navigator.push(context, MaterialPageRoute(builder:(context)=>VacancyPage(vacancy: vacancy,)))
      },
    );
  }
}
