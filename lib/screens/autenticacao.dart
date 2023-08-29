import 'package:flutter/material.dart';
import 'package:gym_proj/_core/cores.dart';
import 'package:gym_proj/commum/snackbar_custom.dart';
import 'package:gym_proj/components/decor_input_aut.dart';

import '../services/auten_service.dart';

class AutenticarTela extends StatefulWidget { 
  const AutenticarTela({super.key});

  @override
  State<AutenticarTela> createState() => _AutenticarTelaState();
}

class _AutenticarTelaState extends State<AutenticarTela> {
  bool cadastro = false;   
  String? _senha;
  final _formKey = GlobalKey<FormState>();

  //controladores dos campos de texto
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _usuarioController = TextEditingController();

  //cadastro no firebase
  AuthenService _authenService = AuthenService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262626),   //tem que ir la no pubspect.yaml e falar da pasta assets
      
      body: Stack(
        children: [
          Container(decoration: const BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            Cores.cinzaTopoGrad, Cores.cinzaFundoGrad
          ],),),),

          Padding(
            padding: const EdgeInsets.all(18.0), 
            child: Form( //tem que chamar o form pra poder usar o validator, mas como nao tem controller
              key: _formKey,   //entao teve q criar uma key para poder se referir ao form
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch,  //stretch é pra esticar
                    children: [
                      Image.asset("assets/levantamento-de-peso.png", height: 180),
                      const Text("Academia", 
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
                          
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAutInputDecor("Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (String ? value) {
                          if(value==null){
                            return "Preencha o e-mail";
                          }
                          if(!value.contains("@") && !value.contains(".")){
                            return "Preencha com um e-mail válido fulano@email.com";
                          }
                          if(value.length < 6){
                            return "E-mail pequeno demais";
                          }
                          
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getAutInputDecor("Senha"), obscureText: true, 
                        validator: (String ? value) {
                          if(value==null){
                            return "Preencha a senha";
                          }
                          if(value.length < 5){
                            return "Senha pequena demais (min 6)";
                          }
                          // Verifica se a senha contém pelo menos uma letra maiúscula
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return "A senha deve conter pelo menos uma letra maiúscula";
                          }

                          // Verifica se a senha contém pelo menos um caractere especial
                          if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                            return "A senha deve conter pelo menos um caractere especial (!@#\$%^&*(),.?\":{}|<>)";
                          }
                          _senha = value;
                          return null;
                          },
                      ),                      
                      Visibility(visible: cadastro, child: Column(children: [
                      
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: getAutInputDecor("Confirme sua Senha"), obscureText: true,
                        validator: (String? value) {
                          if(value != _senha){
                            return "As senhas não coincidem";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _usuarioController,
                        decoration: getAutInputDecor("Nome de Usuário"), 
                        validator: (String ? value) {
                          if(value==null){
                            return "Preencha o nome de usuário";
                          }
                          if(value.length < 5){
                            return "Nome de usuário curto (min 6)";
                          }
                          
                          return null;
                        },
                      ),

                      ]),),
                      
                      const SizedBox(height: 22),
                      ElevatedButton(onPressed: (){ mainBtnClicado(); },
                       style: ElevatedButton.styleFrom(backgroundColor: Cores.roxoAzulado),
                       child: Text( (!cadastro)? "Logar" : "Registrar" , style: const TextStyle(color: Colors.white), ), ),
                      const Divider(),
                      TextButton(onPressed: (){
                        setState(() {
                          cadastro = !cadastro;
                        });
                      
                      },
                      child: Text((!cadastro)?"Não tem conta? Cadastre-se":"Já possui conta? Entrar" , style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  mainBtnClicado(){  //aq faz a validação do form
    if (_formKey.currentState!.validate()) { //
      if(!cadastro){
        print("logou!");
      }
      else{
        print("cadastrou!");
        print("${_emailController.text} - ${_senhaController.text} - ${_usuarioController.text}");
        _authenService.cadastrarUser(email: _emailController.text, senha: _senhaController.text, usuario: _usuarioController.text)
          .then((String ? erro) { //then é o que vai acontecer depois que o cadastrarUser terminar de rodar
            if(erro != null){
              mostrarSnackbarCustom(context: context, msg: erro);
            }
            else{
              mostrarSnackbarCustom(context: context, msg: "Cadastrado com sucesso!", erro: false);
            }
          } );
      }
    }
    else{
      print("entrada invalida!");
    }


  }

}