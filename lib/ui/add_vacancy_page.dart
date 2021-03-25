import 'package:flutter/material.dart';
import 'package:loga/shared/models/vacancy.dart';
import 'package:loga/shared/providers/vacancies.dart';
import 'package:provider/provider.dart';

class AddVacancy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    void addVacancy(Vacancy vacancy){
      Provider.of<Vacancies>(context, listen:false).addVacancy(vacancy);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número da vaga',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(onPressed: (){
              int identifier = int.parse(controller.text);
              addVacancy(Vacancy(id: identifier, history: []));
            },child: Text('Salvar'))
          ],
        ),
      ),
    );
  }
}
