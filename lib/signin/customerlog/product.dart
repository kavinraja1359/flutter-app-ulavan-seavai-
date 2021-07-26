import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Drawer.dart';
import 'appbar.dart';
import 'data.dart';


class product extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return product2();
  }
}

class product2 extends State<product> {
  @override
  Widget build(BuildContext context) {
    int temp_index = product_id.indexOf(temp_product_list[cilckeddata]);
    print(product_available[temp_index].toString().length);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
        appBar: appbarss(context),
        drawer: drawerss(context),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                product_list[temp_index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                  child: Align(
                      child: Image.network(
                product_image[temp_index],
                alignment: Alignment.center,
              ))),
              Spacer(
                flex: 2,
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Text(
                      "AVAILABLE QUANTITY: ",
                      style: TextStyle(fontSize:25,color: Colors.redAccent),
                    ),
                    Text(
                      product_available[temp_index].toString() + "kg",
                      style: TextStyle(fontSize:30,color: Colors.black),
                    ),
                  ])),
              Spacer(
                flex: 1,
              ),
              Container(
                width: 200,
                child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      onChanged: (String sf) {
                        if (double.tryParse(sf) != null &&
                            double.tryParse(sf) <=
                                product_available[temp_index]) {
                          quansel = double.tryParse(sf);
                          avalbool = true;
                        } else {
                          avalbool = false;
                        }
                      },
                      keyboardType: TextInputType.number,
                      cursorWidth: 10.0,
                      decoration: InputDecoration(
                          icon: Text("REQUIERD QTY:"),
                          hintMaxLines:
                              product_available[temp_index].toString().length,
                          suffix: Text("KG"),
                          border: OutlineInputBorder()),
                    )),
              ),
              Spacer(
                flex: 2,
              ),
              TextButton(
                child: Text('ADD TO CART'),
                onPressed: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                            title: avalbool
                                ? Text("ADDED TO CART")
                                : Text("REQUESTED AMT OF STOCK NOT AVAILABLE"),
                            content: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ));
                      },
                    );

                    print(temp_index);
                    if (avalbool == true) {
                      subtotal=subtotal+product_price[temp_index]*quansel;
                      Navigator.of(context).pushNamed('/cartpage');

                      if (!cart_p_id.contains(product_id[temp_index])) {
                        product_available[temp_index] =
                            product_available[temp_index] -quansel;
                        cart_p_id.add(product_id[temp_index]);
                        cartquan.add(quansel);
                      } else {
                        print(temp_index);
                        int temp = cart_p_id.indexOf(product_id[temp_index]);
                        product_available[temp_index] =
                            product_available[temp_index] - quansel;
                        cartquan[temp] = cartquan[temp] + quansel;
                      }
                      print(avalbool);
                      fire().addcart();
                    } else {
                      print('stock');
                    }
                  });
                },
               ),
              Spacer(
                flex: 1,
              )
            ]));
  }
}
