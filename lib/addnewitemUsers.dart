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

import 'package:planet/signup_screen.dart';
import 'package:planet/switchscree.dart';

import 'Roles.dart';
import 'command.dart';

class AddNewItemUser extends StatefulWidget {
  const AddNewItemUser({Key? key}) : super(key: key);

  @override
  State<AddNewItemUser> createState() => _AddNewItemUserState();
}
 String formattedDate =
    '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
String formattedTime =
    '${(now.hour + 1).toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
class _AddNewItemUserState extends State<AddNewItemUser> {
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
  var fullame, phone,address , imageURL, red;
  CollectionReference additem =
      FirebaseFirestore.instance.collection("New Items");

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
                          .child("$image");

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
      await additem.add({
        "Date" : formattedDate,
        "Time " : formattedTime,
        "full name": fullame,
        "phone": phone,
        "address":address,
        "image": imageURL,
        "userid": FirebaseAuth.instance.currentUser!.uid
      }
      );
       AwesomeDialog(
              context: context, title: "error", body: Text('Item submitted.'))
            ..show();
     // Navigator.push(
     //     context, MaterialPageRoute(builder: (context) => SignUp()));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Form(
      key: redhawk,
      child: Column(children: [
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
                keyboardType: TextInputType.phone,
                minLines: 1,
                maxLines: 3,
                onSaved: (val) {
                  phone = val;
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
                  filled: true,
                  hintText: 'Phone Number',
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: _textFieldController3,
                maxLength: 30,
                // obscureText: true,
                onSaved: (val) {
                  address = val;
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
                  hintText: 'Adress',
                  labelText: "Adress",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 110,
              child: RoundedButton(
                buttonColor: Colors.green,
                onPressed: () {
                  showbutton(context); 
                    
                },
                title: " addpicture",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              buttonColor: Colors.green,
              onPressed: () async {
                await valese(context);
                _submitForm();
                        setState(() {});
              },
              title: " execter",
            ),
            
      ]),
    ),
    
          ],
          
        ));
  }
}
