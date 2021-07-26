import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:direct_farmer/main.dart';
import 'data.dart';
import '../../auth/login.dart';

Widget drawerss(BuildContext context) {
  return
    Drawer(
      child: (ListView(children: <Widget>[
        AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (back != 0) {
                Navigator.pop(context);
                back--;
              }
            },
          ),
          title: Text("Main Menu"),
        ),
        GestureDetector(
          onTap: () {
            back++;
            Navigator.of(context).pushNamed('/mainpage');
          },
          child: Card(
            elevation: 10,
            child: Text(
              "Home",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            back++;
            Navigator.of(context).pushNamed('/cartpage');
          },
          child: Card(
            elevation: 10,
            child: Text(
              "cart",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 10,
            child: Text(
              "settings",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title:
                  Text("CONFIRM SIGN OUT"),

                  actions: <Widget>[
                    TextButton(
                      onPressed: ()async{
                        cart_p_id.clear();
                        cartquan.clear();
                        product_price.clear();
                       product_list.clear();
                      product_image.clear();
                       product_id.clear();
                        product_available.clear();
                        subtotal=0;
                        await FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.push(
                      context,
                       MaterialPageRoute(
                      builder: (context) => HomePage())));
                         }
                      ,
                        child: Text("SIGN OUT", style: TextStyle(color: Colors
                            .green, fontSize: 15),)),
                    TextButton(
                      child: Text("CANCEL", style: TextStyle(color: Colors
                          .green, fontSize: 15),), onPressed: () {
                      Navigator.pop(context);
                    },),
                  ],
                );
              },
            );
          },
          child: Card(
            elevation: 10,
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ])),
    );
}