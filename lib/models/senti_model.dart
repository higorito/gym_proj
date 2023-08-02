class SentiModel {
  String id;
  String sentindo;
  String data;

  SentiModel({
    required this.id,
    required this.sentindo,
    required this.data,
  });

  SentiModel.fromMap(Map<String, dynamic> map, String id)
      : id = map['id'],
        sentindo = map['sentindo'],
        data = map['data'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sentindo': sentindo,
      'data': data,
    };
  }

}