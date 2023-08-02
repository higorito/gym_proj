import 'package:flutter/material.dart';
import 'package:gym_proj/_core/cores.dart';
import 'package:gym_proj/models/ex_model.dart';
import 'package:gym_proj/models/senti_model.dart';
import 'package:gym_proj/models/cargas_model.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ExModel exercicioModelo = ExModel(id: "teste1", name: "Puxada Alta", treino: "Costas(B)", comoFazer: "puxa puxa puxa puxa");

  final List<SentiModel> listaSentindo = [ SentiModel(id: "SEN1", sentindo: "PUXAAAAAA ", data: "2023/08/01"),
                                           SentiModel(id: "SEN2", sentindo: "PUXEEEIIIII", data: "2023/08/04"),
   ];
  final List<CargasModel> listaCargas = [ CargasModel(id: "CAR1", carga: "160", data: "2023/08/01", metodo: "Piramide"),
                                          CargasModel(id: "CAR2", carga: "170", data: "2023/08/04", metodo: "Piramide"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor:  Cores.roxoAzulado,
      appBar: AppBar( 
        title: Column(
          children: [ 
            Text(exercicioModelo.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),   //use ctrl + espaço para ver as opções de estilo e tambem observe que vem escrito o valor padrao
            Text(exercicioModelo.treino, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500 , color: Colors.grey)),
          ],
        ), 
        

      backgroundColor: Cores.roxoEscuro,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 80,

      shape: const RoundedRectangleBorder( //borda do appbar
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32),),),


      ),

      body: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Cores.cinzaEscuro, borderRadius: BorderRadius.circular(16),),
        child: ListView( 
         
          //crossAxisAlignment: CrossAxisAlignment.start, // alinhamento horizontal //usei antes quando era coluna 
        
          children: [
            SizedBox(
              height: 250,
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,  //coloca um espaço entre os elementos antes e depois
                children: [
                  ElevatedButton(onPressed: () {  },
                  child: const Text("BNT 1 FOTO"),
                  ),
                  ElevatedButton(onPressed: () {  },
                  child: const Text("BTN 2 FOTO"),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12,),
            
            const Text("Como fazer?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white ),),
            const SizedBox(height: 8,),
            Text(exercicioModelo.comoFazer , style: const TextStyle(color: Colors.white),),
            const Padding(
              padding:  EdgeInsets.all(12.0),
              child:  Divider(color:  Colors.grey ),
            ),
      
            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4D38AE)),),
              
            onPressed: () {  },
            child: const Text("Após o Divider" , style: TextStyle(color: Colors.white),
            ),
            
            ),
            const SizedBox(height: 12,),

            const Text("Minhas Cargas", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white ),),
            const SizedBox(height: 8,),
            Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaCargas.length, (index) { //tamanho e func do que vai ser gerado
                CargasModel cargaAgora = listaCargas[index];
                return ListTile( dense: true, //deixa mais compacto
                  contentPadding: EdgeInsets.zero,
                  title: Text("${cargaAgora.carga}kg - ${cargaAgora.metodo}", style: const TextStyle(color: Colors.white), ),
                  subtitle: Text(cargaAgora.data , style: const TextStyle(color: Colors.white),),
                  leading: const Icon(Icons.double_arrow_sharp, color: Color(0xFF4D38AE),),    //colocar no inicio
                  trailing: IconButton(onPressed: () {  }, icon: const Icon(Icons.delete, color: Colors.red,),), //colocar no final  //iconbutton é um botão com icone
                );
              }, 
              ),       
            ),
            const Divider(),
      
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add_home),
      )
    ); 
  }
}