import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:direct_farmer/main.dart';
import 'package:direct_farmer/signin/customerlog/data.dart';

class farmerpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<farmerpage> {
  String _productname;
  String _phoneNumber;
  String _productqanr;
  TextEditingController pname=TextEditingController(),pnum=TextEditingController(),pqan=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      controller: pname,
      decoration: InputDecoration(labelText: 'ProductName',border:OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.red),
      ),),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _productname = value;
        pname.text='';
      },
    );
  }


  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: pnum,
      decoration: InputDecoration(labelText: 'Phone number',border:OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.red),
    ), ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
        pnum.text='';
      },
    );
  }

  Widget productquantity() {
    return TextFormField(
      controller: pqan,
      decoration: InputDecoration(labelText: 'ProductQuantity',border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.red),
    ),),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int quanty = int.tryParse(value);

        if (quanty == null || quanty <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _productqanr = value;
        pqan.text='';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Farmers  Product Entry"),leading: ElevatedButton(child: Text("Log   out"),onPressed: ()async{

        await FirebaseAuth.instance.signOut().then((value) =>
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage())));


      },),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
              SizedBox(height: 100),
                _buildPhoneNumber(),
                SizedBox(height: 100),
                productquantity(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();
                    print(_productname);
                    print(_phoneNumber);
                    print(_productqanr);
                     fun(context: context,title:"SUBMITED YOU WILL GET A CALL IN A MINUITE",OKtext: "OK");
                     fire().farmeradd(_productname, _phoneNumber, _productqanr);
                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

fun({context,title,OKtext}){


showDialog(
context: context,
builder: (BuildContext context) {
// return object of type Dialog
return AlertDialog(
title:Text(title),

actions: <Widget>[
TextButton(
onPressed:(){Navigator.pop(context);}
,
child: Text(OKtext, style: TextStyle(color: Colors
    .green, fontSize: 15),)),
],
);
},
);
}


