import 'package:firebase_auth/firebase_auth.dart';

class AuthenService{
  FirebaseAuth _authFirebase = FirebaseAuth.instance;
  
  cadastrarUser({
    required String email,
    required String senha,
    required String usuario,
  }) async {
      UserCredential usuarioCred = await _authFirebase.createUserWithEmailAndPassword(email: email, password: senha);

      await usuarioCred.user!.updateDisplayName(usuario);
  }

}