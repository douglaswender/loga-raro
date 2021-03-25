import 'package:loga/shared/models/truck.dart';

class Vacancy {
  int id;
  bool disponivel;
  List<Truck> history;

  Vacancy({this.id, this.disponivel = true, this.history});

  Vacancy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    disponivel = json['disponivel'];
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        history.add(new Truck.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['disponivel'] = this.disponivel;
    if (this.history != null) {
      data['truck'] = this.history.map((v)=> v.toJson()).toList();
    }
    return data;
  }
}