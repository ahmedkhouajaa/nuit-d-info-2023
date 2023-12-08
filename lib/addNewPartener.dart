import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planet/Roles.dart';
import 'package:planet/partenershisorique.dart';

import 'package:planet/signup_screen.dart';
import 'package:planet/switchscree.dart';

import 'historiquesofpartener.dart';

class AddNewPartener extends StatefulWidget {
  const AddNewPartener({Key? key}) : super(key: key);

  @override
  State<AddNewPartener> createState() => _AddNewPartenerState();
}

class _AddNewPartenerState extends State<AddNewPartener> {

  void _submitForm() {
    _textFieldController1.clear();
    _textFieldController2.clear();
    _textFieldController3.clear();
    
  }
TextEditingController _textFieldController1 = TextEditingController();
TextEditingController _textFieldController2 = TextEditingController();
TextEditingController _textFieldController3 = TextEditingController();

String _submittedContent1 = '';
String _submittedContent2 = '';
String _submittedContent3 = '';


  GlobalKey<FormState> redhawk = new GlobalKey<FormState>();
  File? file;
  var fullame, email, red;
  CollectionReference addpart =
      FirebaseFirestore.instance.collection("Parteners");

  

  valese(context) async {
    var formdata = redhawk.currentState;
    if (formdata!.validate()) {
      formdata.save();
      

    
      
      await addpart.add({
        "email": fullame,
        "fullname": email,
        "password" : red,
        "points" : "0",
       
      });
       AwesomeDialog(
              context: context, title: "error", body: Text('Partener added'))
            ..show();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("add New Partner"),backgroundColor: Colors.green,actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (RoleSelectionScreen())));
            },
          ),
        ],),drawer: Drawer(

          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  SizedBox(height: 30,),
                  ListView(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      // Important: Remove any padding from the ListView.
                                      padding: EdgeInsets.zero,
                                      children: [
                                       
                                        
                                        ListTile(
                                          leading: const Icon(Icons.history_outlined),
                                          title: Text('"All Historiques"'),
                                          onTap: () {
                                            // Update the state of the app
                                            // ...
                                            // Then close the drawer
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Histoique()));
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.history_rounded),
                                          title: const Text('Partener Historique'),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                       AdminPartener ()));
                                          },
                                        ),
                                      ],
                                    ),
                ],
              ),
            ],
          )
                          
                    
                    
      ), 
        body: Container(width : double.infinity,
          height: double.infinity,
       //   decoration: BoxDecoration(
        //    image: DecorationImage(image:AssetImage("images/background.png") )
        //  ),
          child: Form(
              key: redhawk,
              child: Column(
                
                
                
                children: [
                
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: _textFieldController1,
              maxLength: 30,
              // obscureText: true,
              onSaved: (val) {
                fullame = val;
              },
              validator: ((val) {
                if (val!.length > 100) {
                  return "passs is heih";
                }
                if (val.length < 4) {
                  return "pass is weak";
                }
              }),
        
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: 'Full Name',
                labelText: "Full Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 25,
            
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: _textFieldController2,
              maxLength: 30,
              // obscureText: true,
              onSaved: (val) {
                email = val;
              },
              validator: ((val) {
                if (val!.length > 100) {
                  return "passs is heih";
                }
                if (val.length < 4) {
                  return "pass is weak";
                }
              }),
        
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                
                hintText: 'partener email',
                labelText: "partener email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
           SizedBox(
            height: 25,
            
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: _textFieldController3,
              
              minLines: 1,
              maxLines: 3,
              onSaved: (val) {
                red= val;
              },
              validator: ((val) {
                if (val!.length > 100) {
                  return "passs is heigh";
                }
                if (val.length < 4) {
                  return "pass is weak";
                }
              }),
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                
                hintText: 'partener password',
                labelText: 'partener password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          
          SizedBox(
            width: 130,
            child: RoundedButton(
              buttonColor: Colors.green,
              onPressed: () async {
               await valese(context);
                _submitForm();
                    setState(() {});
              },
              title: " Add Partner",
            ),
          ),
               
              ]),
            ),
        ));
  }
}