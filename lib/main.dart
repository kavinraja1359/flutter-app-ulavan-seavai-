import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'signin/customerlog/data.dart';
import 'signin/customerlog/FadeAnimation.dart';
import 'auth/login.dart';
import 'auth/signup.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    title: 'farmers',
  ));
}





class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.green[900],
                  Colors.lightGreen,
                  Colors.yellowAccent
                ]),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "DIRECT FARMERS ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                 SizedBox(height: 80,),
                 FadeAnimation(
        1.2,
        Container(
        height: MediaQuery.of(context).size.height / 4,

        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backpro.jpeg'),
            )),
      )),
         SizedBox(height: 20,),
                  FadeAnimation(
                      1.2,
                      Container(

                        height: MediaQuery.of(context).size.height / 10,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[Text("User Type:",style: TextStyle(fontSize: 20,color: Colors.white),), LiteRollingSwitch(
                          textOff: "Farmer",
                          textOn: "customer",
                          colorOn: Colors.orange,
                          colorOff: Colors.blueAccent,
                          onChanged: (bool state){navfam=!state;},
                        )],)
                        ))

    ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1.5,
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.6,
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              bottom: BorderSide(color: Colors.white),
                              top: BorderSide(color: Colors.white),
                              left: BorderSide(color: Colors.white),
                              right: BorderSide(color: Colors.white),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
