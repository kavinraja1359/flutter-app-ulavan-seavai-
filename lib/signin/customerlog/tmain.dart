
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product.dart';
import 'Drawer.dart';
import 'appbar.dart';
import 'cart.dart';
import 'data.dart';
import 'listtile.dart';

class mainclass2 extends StatelessWidget {
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      title: 'Direct Farmers',
      home: mainclass(),
      routes: <String, WidgetBuilder>{
        '/cartpage': (BuildContext context) => cartclass(),
        '/mainpage': (BuildContext context) => mainclass(),
        '/productpage': (BuildContext context) => product()
      },
    );
  }
}

class mainclass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return class2();
  }
}

class class2 extends State<mainclass> {
  @override
  void fun(String st) {
    temp_product_list.clear();
    int y = 0;
    while (y < product_list.length) {
      if (product_list[y].toLowerCase().contains(st.toLowerCase())) {
        setState(() {
          temp_product_list.add(product_id[y]);
        });
      }
      y++;
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: appbarss(context),
        drawer: drawerss(context),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tryim.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: <Widget>[

              Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                  child: new TextField(

                    decoration: new InputDecoration(hintText: "Search product"
                        ,prefixIcon: Icon(Icons.search)),
                    onChanged: fun,
                  )),
              Expanded(
                  child:Container(
                    width: 400,
                    child:ListView.builder(
                        itemCount: temp_product_list.length,
                        itemBuilder: (context, index) {
                          int temp_index =
                          product_id.indexOf(temp_product_list[index]);
                          return tile(temp_index,index,context,false);
                        }),)
              ),
            ]
            )
        )
    );
  }
}
