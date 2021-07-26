import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'data.dart';
Widget appbarss(BuildContext context) {
  return AppBar(
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
    title:Container(
      child: Row(
        children: [
          Text("FARMING"),

        ],
      ),
    ) ,
    actions: <Widget>[

      IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 40.0,
        ),
        onPressed: () {
          back++;
          Navigator.of(context).pushNamed('/cartpage');
        },
      ),
    ],
  );
}
