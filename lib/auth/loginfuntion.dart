import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:direct_farmer/signin/customerlog/tmain.dart";
import 'aut.dart';
void loginmain(BuildContext context,String userid,String userpass)async {
  final  _auths=authz();
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
dynamic loginid=await _auths.signInAnon();

if(loginid!=null) {
  print('hell0'+loginid.toString());
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => mainclass2()));
return loginid;
}
else{
print('error');

}
}