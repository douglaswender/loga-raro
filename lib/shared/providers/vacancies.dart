import 'package:flutter/cupertino.dart';
import 'package:loga/shared/models/truck.dart';
import 'package:loga/shared/models/vacancy.dart';

class Vacancies extends ChangeNotifier{
  List<Vacancy> vacancies = [
    Vacancy(id: 1, disponivel: true, history: [Truck(id: 1, horarioEntrada: "2021-03-24T09:45", horarioSaida: "2021-03-24T13:45"), Truck(id: 2, horarioEntrada: "2021-03-24T14:00", horarioSaida: "2021-03-24T17:00")]),
    Vacancy(id: 2, disponivel: false, history: [Truck(id: 2, horarioEntrada: "2021-03-24T09:45", horarioSaida: "2021-03-24T13:45")]),
    Vacancy(id: 3, disponivel: true, history: [Truck(id: 3, horarioEntrada: "2021-03-24T09:45", horarioSaida: "2021-03-24T13:45")]),
    Vacancy(id: 4, disponivel: true, history: [Truck(id: 4, horarioEntrada: "2021-03-24T09:45", horarioSaida: "2021-03-24T13:45")]),
    Vacancy(id: 5, disponivel: true, history: [Truck(id: 5, horarioEntrada: "2021-03-24T09:45", horarioSaida: "2021-03-24T13:45")]),
    Vacancy(id: 6, disponivel: false, history: [Truck(id: 6, horarioEntrada: "2021-03-24T09:45", horarioSaida: "2021-03-24T13:45")]),
  ];

  void addVacancy(Vacancy vacancy){
    vacancies.add(vacancy);
    notifyListeners();
  }
}