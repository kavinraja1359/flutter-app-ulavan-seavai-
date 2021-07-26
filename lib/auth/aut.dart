import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:direct_farmer/auth/signup.dart';
import 'package:direct_farmer/signin/customerlog/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class authz{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  //sign anomus
Future signInAnon() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  try{

    Result=await _auth.signInWithEmailAndPassword(email: mainuserid, password: mainpassword);
    logintemp=true;
    }catch(e){
    logintemp=false;
    return null;
  }

}
}