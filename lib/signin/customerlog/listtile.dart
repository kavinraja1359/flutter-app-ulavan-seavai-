import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';
Widget tile(int temp_index,int index,BuildContext context,bool maincart){
  return Container(
   margin: EdgeInsets.all(10),
   width: 320,
   decoration: BoxDecoration(
     color: Colors.brown,
     borderRadius: BorderRadius.circular(15),

   ),
   child:GestureDetector(
     onTap: () {
       back++;
       cilckeddata = index;
       Navigator.of(context).pushNamed('/productpage');
     },

     child:Row(
     children: <Widget>[Image.network(product_image[temp_index]
     ,width: 100,height: 50,),
     Column(
       children: [
         Column(
           children:[Text(product_list[temp_index],style: TextStyle(fontSize:40,color: Colors.black),),
         Text("AVL QTY:" +
             product_available[temp_index].toString() +
             "KG",style: TextStyle(color: Colors.black),)],)],
     )
     ,
     Spacer(),
     Text(maincart?("INCART:"+cartquan[index].toString()+"Kg\ncost:"+": ₹"+(product_price[temp_index]*cartquan[index]).toString()
     ):("price:₹"+product_price[temp_index].toString()+"/KG")),
     Spacer()
   ]),)
  );




}