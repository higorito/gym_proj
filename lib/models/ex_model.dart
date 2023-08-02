class ExModel {  //aq guarda coisas do mundo real e depois firebase, coleções, API etc... 
    String id;
    String name;
    
    String treino;
    String comoFazer;

    String? urlImg;

    ExModel({         //construtor 2 tipos, nomeados com {}  e required torna obrigatório 
        required this.id,
        required this.name,
        required this.treino,
        required this.comoFazer,
        this.urlImg,
    });

    //construtor nomeado   //para futuramente fazer conversões 
    ExModel.fromMap(Map<String, dynamic> map, String id) :
        id = map['id'],
        name = map['name'],
        treino = map['treino'],
        comoFazer = map['comoFazer'],
        urlImg = map['urlImg'];

    //conversão para map 
    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'name': name,
            'phone': treino,
            'comoFazer': comoFazer,
            'urlImg': urlImg,
        };
    }
     

}