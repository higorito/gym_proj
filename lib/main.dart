import 'package:flutter/material.dart';

//importacoes firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


//minhas importacoes telas
import 'package:gym_proj/screens/autenticacao.dart';
import 'package:gym_proj/screens/home.dart';

//como eu adicionei umas coisas no .gitignore precisa fazer o flutterfire configure se for em outra maquina

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //para avisar o flutter q a funcao é assincrona
  //antes da main para iniciar o firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white, ),
       
        useMaterial3: true,
      ),
      home: AutenticarTela(),
    );
  }
}

