import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenService{
  FirebaseAuth _authFirebase = FirebaseAuth.instance;
  
  cadastrarUser({
    required String email,
    required String senha,
    required String usuario,
  }) async {
      try {
        UserCredential usuarioCred = await _authFirebase.createUserWithEmailAndPassword(email: email, password: senha);
        
        await usuarioCred.user!.updateDisplayName(usuario);
    } on FirebaseAuthException catch (e) { //aq é o erro do firebase
      if (e.code == "email-already-in-use") {
        print("deu ruim nao cadastrou");  //colocaruma snackbar dps
      }
        
      
    }
  }

}