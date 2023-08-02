class CargasModel {
  String id;
  String carga;
  String data;
  String? metodo;

  CargasModel({
    required this.id,
    required this.carga,
    required this.data,
    this.metodo,
  });

  CargasModel.fromMap(Map<String, dynamic> map, String id)
      : id = map['id'],
        carga = map['carga'],
        data = map['data'],
        metodo = map['metodo'];
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'carga': carga,
      'data': data,
      'metodo': metodo,
    };
  }
  
}