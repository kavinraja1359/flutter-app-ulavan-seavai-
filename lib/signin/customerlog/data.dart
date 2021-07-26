import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:direct_farmer/auth/signup.dart';
String mainuserid;
String mainpassword;
bool navfam=true;
int back=0;
 bool avalbool=false;
  double quansel=0;
  double subtotal=0;
  int cilckeddata=0;
  //image data for products
  List<String> product_image;

  //products data
  //table
bool logintemp=false;
  List<double>product_price=[];
  List<double> product_available=[];
  List<String> product_list=[];
  List<int> product_id=[];
  List<int> temp_product_list = product_id.toList(growable: true);
//carts data
  List<int> cart_p_id = [];
  List<double> cartquan = [];
//
///
UserCredential Result;
class fire{
 final FirebaseAuth _auth=FirebaseAuth.instance;
Future<void> addsignupdetails()async{
 try{
  Result=await _auth.signInWithEmailAndPassword(email: mainuserid, password: mainpassword);

  CollectionReference usercol = FirebaseFirestore.instance.collection('cart');
  DocumentReference dotReferencer = usercol.doc(FirebaseAuth.instance.currentUser.uid);


  final CollectionReference userCollection = FirebaseFirestore.instance.collection('userb');
   DocumentReference documentReferencer = userCollection.doc(Result.user.uid);
   Map<String,dynamic> task={
    "name":namec.text,
    "email":emailc.text,
    "phonenumber":phonec.text,
    "password":passwordc.text,
    "uid":Result.user.uid
   };
   List<int> k=[-1];
  Map<String,dynamic> tasks={
   "cart":k.toList(),
   "cartquan":k.toList(),
   "uid":Result.user.uid,
   "subtotal":0
  };
  await dotReferencer.set(tasks);
  await documentReferencer.set(task);
  print("done");

 }catch(e){
  return null;
 }
}

 Future<void> addcart()async{
  try{
    CollectionReference usercol = FirebaseFirestore.instance.collection('cart');
   DocumentReference dotReferencer = usercol.doc(FirebaseAuth.instance.currentUser.uid);
   CollectionReference usercommon = FirebaseFirestore.instance.collection('common');
   DocumentReference documentReferencercomon = usercommon.doc("D7fzzrejVgv6JVcGXVwD");
   Map<String,dynamic> task={
    "cart":cart_p_id.toList(),
    "cartquan":cartquan.toList(),
    "uid":FirebaseAuth.instance.currentUser.uid,
    "subtotal":subtotal
   };
   List<String> psp=[];
       int t=0;
       psp.clear();
   while(t<product_available.length) {
    psp.add(product_available[t].toString());
    t++;
   }
   Map<String,dynamic> tasks={
    "product_available":psp.toList(),

   };
   await dotReferencer.set(task);
   await documentReferencercomon.update(tasks);
   print("done");

  }catch(e){
   return null;
  }
 }






 Future<void> farmeradd(String name,String phno,String productquan)async{
   try{
     CollectionReference usercol = FirebaseFirestore.instance.collection('farmer');
     DocumentReference dotReferencer = usercol.doc(FirebaseAuth.instance.currentUser.uid);
     var inside=dotReferencer.collection('1');
     Map<String,dynamic> task={
       "prodductname":name,
       "phoneno":phno,
       "uid":FirebaseAuth.instance.currentUser.uid,
       "productquan":productquan
     };
     await inside.add(task);
     print("done");
   }catch(e){
     return null;
   }
 }











 Future<void> getdata()async{
  try{

   CollectionReference usercommon = FirebaseFirestore.instance.collection('common');
   CollectionReference userCollection = FirebaseFirestore.instance.collection('cart');
   DocumentReference documentReferencer = userCollection.doc(Result.user.uid);
   DocumentReference documentReferencercomon = usercommon.doc("D7fzzrejVgv6JVcGXVwD");
   await documentReferencer.get().then((doc){
    Map<String,dynamic> taskqw=doc.data();
//cart details
    print("\n\n\n\n\n\n\n"+taskqw.toString()+"\n\n\n\n\n\n\n\n\n");
if(taskqw["cart"].toString()!="[-1]") {
          cart_p_id = new List<int>.from(taskqw["cart"]);
          cartquan = new List<double>.from(taskqw["cartquan"]);
          subtotal = taskqw["subtotal"];
        }
      });
   print("\n\n\n\n\n\n\n"+"db.toString()"+"\n\n\n\n\n\n\n\n\n");
//common details
   await documentReferencercomon.get().then((doc){
    Map<String,dynamic> taskqw2=doc.data();
    print("jjjjjjjjjj");

     product_id=new List<int>.from(taskqw2["product_id"]);
     // temp_product_list=new List<int>.from(taskqw2["product_id"]);
     product_list=new List<String>.from(taskqw2["product_name"]);
    product_image=new List<String>.from(taskqw2["product_image"]);
   var ppp= new List<String>.from(taskqw2["product_price"]);
   var fff=new  List<String>.from(taskqw2["product_available"]);
   int t=0;
   product_price.clear();
   product_available.clear();
   while(t<ppp.length) {
         product_available.add(double.parse(fff[t]));
          product_price.add(double.parse(ppp[t])) ;
          t++;
        }
      });


  }catch(e){
   return null;
  }
 }




}