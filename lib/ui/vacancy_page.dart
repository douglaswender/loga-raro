import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loga/shared/models/truck.dart';
import 'package:loga/shared/models/vacancy.dart';
import 'package:loga/shared/providers/vacancies.dart';
import 'package:provider/provider.dart';

class VacancyPage extends StatefulWidget {
  final Vacancy vacancy;

  const VacancyPage({Key key, @required this.vacancy}) : super(key: key);

  @override
  _VacancyPageState createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController controller = TextEditingController();

    void addTruckToVacancy() {
      Provider.of<Vacancies>(context, listen: false)
          .addTruckToVacancy(widget.vacancy.id, int.parse(controller.text));
      FocusScope.of(context).unfocus();
      setState(() {});
    }

    void removeTruckToVacancy() {
      Provider.of<Vacancies>(context, listen: false)
          .removeTruckToVacancy(widget.vacancy.id);
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  'Vaga ${widget.vacancy.id}',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              widget.vacancy.disponivel
                  ? Container(
                      height: screenHeight * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Situação: Disponível",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Histórico",
                            style: TextStyle(fontSize: 28),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: widget.vacancy.history.length,
                                itemBuilder: (BuildContext context, int index) {
                                  List<Truck> reversedList =
                                      widget.vacancy.history.reversed.toList();
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: ListTile(
                                      title: Text(
                                        "Veículo: ${reversedList[index].id}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Entrada: ${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(reversedList[index].horarioEntrada))}",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            "Saída: ${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(reversedList[index].horarioSaida))}",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Deseja ocupar a vaga?"),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                scrollPadding: EdgeInsets.only(bottom: 999),
                                controller: controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Número do caminhão',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              Container(
                                width: screenWidth,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                    onPressed: addTruckToVacancy,
                                    child: Text('Ocupar')),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: screenHeight * 0.8,
                      child: Column(
                        children: [
                          Text(
                            "Situação: Ocupada",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Veículo estacionado: ${widget.vacancy.history.last.id}",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Histórico",
                            style: TextStyle(fontSize: 28),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: widget.vacancy.history.length,
                                itemBuilder: (BuildContext context, int index) {
                                  List<Truck> reversedList =
                                      widget.vacancy.history.reversed.toList();
                                  /*if(index == 0){
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: ListTile(
                                        title: Text(
                                          "Caminhão: ${reversedList[index].id}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Entrada: ${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(reversedList[index].horarioEntrada))}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "Saída: Ainda não saiu!",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }*/
                                  if (index > 0) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: ListTile(
                                        title: Text(
                                          "Veículo: ${reversedList[index].id}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Entrada: ${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(reversedList[index].horarioEntrada))}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "Saída: ${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(reversedList[index].horarioSaida))}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();
                                }),
                          ),
                          Container(
                            width: screenWidth,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                                onPressed: removeTruckToVacancy,
                                child: Text('Liberar')),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
