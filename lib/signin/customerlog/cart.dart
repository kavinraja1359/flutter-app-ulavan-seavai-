import 'package:flutter/material.dart';
import 'Drawer.dart';
import 'appbar.dart';
import 'data.dart';

import 'listtile.dart';

class cartclass extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarss(context),
        drawer: drawerss(context),
        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(),
          label: Text('CHECKOUT'),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tryim.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                child: Column(children: [
              Card(elevation: 10,

                child:Row(children:[ Spacer(),Text("SUBTOTAL:",style: TextStyle(fontSize: 20),) ,Spacer(),Text(subtotal.toString()),Spacer()],)
              ),
              Expanded(child:
              ListView.builder(
                  itemCount: cart_p_id.length == 0 ? 1 : cart_p_id.length,
                  itemBuilder: (context, index) {
                    if (cart_p_id.length == 0) {
                      return Container(
                          alignment: Alignment.center,
                          child: Column(children: <Widget>[
                            Text(
                              "YOUR CART IS EMPTY",
                              style: TextStyle(fontSize: 20),
                            )
                          ]));
                    } else {
                      int temp_index = product_id.indexOf(cart_p_id[index]);
                      return tile(temp_index, index, context, true);
                    }
                  }),)
            ]))));
  }
}
