import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planet/historiquesofpartener.dart';
import 'package:planet/partenershisorique.dart';

import 'package:planet/signup_screen.dart';

import 'historiqueusersItems.dart';

class AddNews extends StatefulWidget {
  const AddNews({Key? key}) : super(key: key);

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  GlobalKey<FormState> redhawk = new GlobalKey<FormState>();
  File? file;
  var nom, prenon, imageURL, red;
  CollectionReference takenotes =
      FirebaseFirestore.instance.collection("notes");

  showbutton(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "please choose image",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: (() async {
                    //   final ImagePicker _picker = ImagePicker();
                    var piked = await ImagePicker()
                        .getImage(source: ImageSource.camera);
                    //  var image =
                    //    await _picker.pickImage(source: ImageSource.gallery);
                    if (piked != null) {
                      file = File(piked.path);
                      var rand = Random().nextInt(100000);
                      var image = "$rand" + basename(piked.path);
                      red = FirebaseStorage.instance
                          .ref("images")
                          .child("$image")  ;

                       Navigator.of(context).pop();
                      await red.putFile(file);
                     
                     
                    }
                  }),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.photo_outlined),
                        Text(
                          "choose photo from camera",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                    onTap: () async {
                      //   final ImagePicker _picker = ImagePicker();
                      var piked = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      //  var image =
                      //    await _picker.pickImage(source: ImageSource.gallery);
                      if (piked != null) {
                        file = File(piked.path);
                        var rand = Random().nextInt(100000000);
                        var image = "$rand" + basename(piked.path);
                        red = FirebaseStorage.instance
                            .ref("images")
                            .child("$image");
                        await red.putFile(file);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(children: [
                          Icon(Icons.camera),
                          Text(
                            "choose photo from calery",
                            style: TextStyle(fontSize: 20),
                          )
                        ])))
              ],
            ),
          );
        });
  }

  valese(context) async {
    var formdata = redhawk.currentState;
    if (formdata!.validate()) {
      formdata.save();
      if (file != null) print("hello");

      print("hi");
      await red.putFile(file);
      imageURL = await red.getDownloadURL();
      await takenotes.add({
        "title": nom,
        "notes": prenon,
        "image": imageURL,
        "userid": FirebaseAuth.instance.currentUser!.uid
      });
        AwesomeDialog(
              context: context, title: "error", body: Text('Submit succed'))
            ..show();
      
    } else {}
  }
  void _submitForm() {
    _textFieldController1.clear();
    _textFieldController2.clear();
 
    
  }
TextEditingController _textFieldController1 = TextEditingController();
TextEditingController _textFieldController2 = TextEditingController();


String _submittedContent1 = '';
String _submittedContent2 = '';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("add News"),backgroundColor: Colors.green,),drawer: Drawer(

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
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Form(
      key: redhawk,
      child: Column(children: [
            SizedBox(
              height: 150,
            ),
                      Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  controller: _textFieldController1,
                  
                  minLines: 1,
                  maxLines: 3,
                  onSaved: (val) {
                    nom= val;
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
                    
                    hintText: 'title',
                    labelText: 'title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 40,
            ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  controller: _textFieldController2,
                  
                  minLines: 1,
                  maxLines: 3,
                  onSaved: (val) {
                    prenon= val;
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
                    
                    hintText: 'descreption',
                    labelText: 'descreption',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),SizedBox(height: 40,),
             
            ElevatedButton(
               style: ElevatedButton.styleFrom(
    primary: Colors.green, // Background color
  ),
                onPressed: () {
                  showbutton(context);
                },
                
                child: Text("addpicture")),
                SizedBox(height: 20,),
            ElevatedButton(
               style: ElevatedButton.styleFrom(
    primary: Colors.green, // Background color
  ),
                onPressed: () async {
                  await valese(context);
                     _submitForm();
                        setState(() {});
                
                    
                  
                },
                child: Text("execter"))
      ]),
    ),
          ],
        ));
  }
}
