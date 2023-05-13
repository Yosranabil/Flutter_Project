import 'package:firebase_auth/firebase_auth.dart';
import '../../../shared/constants/Variables/Constants.dart';

class FireBaseHelper{
  FirebaseAuth auth=FirebaseAuth.instance;

  Future<dynamic> signUp (String email,String password,String name)async{
    try{
      UserCredential user= await auth.createUserWithEmailAndPassword(email: email, password: password);
      await auth.currentUser!.updateDisplayName(name);
      await auth.currentUser!.reload();
      if(user.user!=null){
        return user.user;
      }
    }on FirebaseAuthException catch(e){
      if(e.code=="email-already-in-use")
      {
        return "The account is already exists for this email";
      }else if(e.code=="weak-password"){
        return "the password is too weak";
      }
    }

  }
  Future<dynamic> signIn (String email,String password)async{
    try{
      UserCredential user= await auth.signInWithEmailAndPassword(email: email, password: password);
      if(user.user!=null){
        return user.user;
      }
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }
  Future<dynamic> signOut ()async {
    try {
      await auth.signOut();
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}