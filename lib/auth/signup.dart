import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:direct_farmer/signin/customerlog/data.dart';
import '../signin/customerlog/FadeAnimation.dart';
import 'login.dart';
import 'loginfuntion.dart';
import '../main.dart';
var namec=TextEditingController(),emailc=TextEditingController(),phonec=TextEditingController(),passwordc=TextEditingController(),repasswordc=TextEditingController();
class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Create an account, It's free",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )),
                ],
              ),
              Flex(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Align(
                      alignment: Alignment.centerLeft,
                      child: FadeAnimation(1.5,Text("Name",style: TextStyle(fontSize: 16,),))),
                  //             Spacer(flex: 1,),
                  FadeAnimation(1.6,Container(
                      width: 400,
                      height: 45,
                      child: TextField(
                        controller: namec,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Name Here',
                        ),
                        autofocus: false,
                      )
                  )
                  ),

                  SizedBox(height: 30,),

                  //              Spacer(flex: 1,),
                  FadeAnimation(1.3,          Align(
                      alignment: Alignment.centerLeft,
                      child: FadeAnimation(1.3,Text("Email",style: TextStyle(fontSize: 16,),))),
      //            Spacer(flex: 1,),
                               ),
                  FadeAnimation(1.3,Container(
                      width: 400,
                      height: 45,
                      child: TextField(
                        controller: emailc,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'new Email id',
                        ),
                        autofocus: false,
                      )
                  )
                  ),
                  SizedBox(height: 30,),


                  Align(
                      alignment: Alignment.centerLeft,
                      child: FadeAnimation(1.5,Text("Phone",style: TextStyle(fontSize: 16,),))),
                  //
                  FadeAnimation(1.4,
                  Container(
                  height: 60,
                    child:IntlPhoneField(
                      controller: phonec,
                    maxLength: 10,
                    decoration: InputDecoration(
                       hintText: 'Phone number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),),),
                  SizedBox(height: 25,),
  //                Spacer(flex: 2,),


                  Align(
                      alignment: Alignment.centerLeft,
                      child: FadeAnimation(1.4,Text("Password",style: TextStyle(fontSize: 16,),))),
    //              Spacer(flex: 1,),
                  FadeAnimation(1.6,Container(
                      width: 400,
                      height: 45,
                      child: TextField(
                        controller: passwordc,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                        autofocus: false,
                      )
                  )
                  ),

               SizedBox(height: 30,),


                  Align(
                      alignment: Alignment.centerLeft,
                      child: FadeAnimation(1.4,Text("Confirm Password",style: TextStyle(fontSize: 16,),))),
     //             Spacer(flex: 1,),
                  FadeAnimation(1.6,Container(
                      width: 400,
                      height: 45,
                      child: TextField(
                        controller: repasswordc,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Retype Password',
                        ),
                        autofocus: false,
                      )
                  )
                  ),



  //                Spacer(flex: 1,),
                ],
              ),
              FadeAnimation(
                  1.5,
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: ()async {
                        print(emailc.text);
                        if(passwordc.text.isNotEmpty&&passwordc.text.compareTo(repasswordc.text)==0){
                        try {
                          print("hhhhh");
                          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailc.text,
                              password: passwordc.text,
                          ).whenComplete(() {
                            mainuserid=emailc.text;
                            mainpassword=passwordc.text;
                            fire().addsignupdetails();
                          });
                          fire().addsignupdetails().whenComplete(() => print("added"));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        }
                        else{
                          print("password error");
                        }

                      },
                      color: Colors.greenAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  )),
              FadeAnimation(
                  1.6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
