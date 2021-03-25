class Truck {
  int id;
  String horarioEntrada;
  String horarioSaida;

  Truck({this.id, this.horarioEntrada, this.horarioSaida});

  Truck.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    horarioEntrada = json['horario_entrada'];
    horarioSaida = json['horario_saida'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['horario_entrada'] = this.horarioEntrada;
    data['horario_saida'] = this.horarioSaida;
    return data;
  }
}