import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet/Roles.dart';
import 'package:planet/command.dart';

import 'package:planet/historiquesofpartener.dart';
import 'package:planet/listeofcommandes.dart';
import 'package:planet/profile/components/body.dart';
import 'package:planet/profile/profile_screen.dart';
import 'package:planet/transfert.dart';

import 'historiqueusersItems.dart';
import 'maps.dart';

class PartenerDash extends StatefulWidget {
  const PartenerDash({super.key});

  @override
  State<PartenerDash> createState() => _PartenerDashState();
}

class _PartenerDashState extends State<PartenerDash> {
  String formattedDate =
      '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  String formattedTime =
      '${(now.hour + 1).toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
  var addpoints, addemail;
  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  String _submittedContent1 = '';
  String _submittedContent2 = '';
  GlobalKey<FormState> partenerhawk = new GlobalKey<FormState>();

  void PartenerDoc() async {
    var formdata = partenerhawk.currentState;

    if (formdata!.validate()) {
      formdata.save();

      String documentId = '';
      FirebaseFirestore.instance
          .collection('users')
          .where('useremail', isEqualTo: addemail)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        if (querySnapshot.docs.isNotEmpty) {
          documentId = querySnapshot.docs.first.id;
          // Do something with the retrieved document ID
          print('## got doc ID = $documentId');
          querySnapshot.docs.first["Points"];
          int myInt = int.parse(addpoints);
          int e = int.parse(querySnapshot.docs.first["Points"]);
          int red = e + myInt;
          String z = red.toString();

          /// add your code here
          await FirebaseFirestore.instance
              .collection("users")
              .doc(documentId)
              .update({
            "Points": z,
          });
          CollectionReference vah =
              FirebaseFirestore.instance.collection("Translation historique");

          await vah.add({
            "day": formattedDate,
            "time": formattedTime,
            "Points": addpoints,
            "workeremail": FirebaseAuth.instance.currentUser!.email,
            "useremail": addemail,
            "userId": FirebaseAuth.instance.currentUser!.uid,
          });
          String documentIdd = '';
          FirebaseFirestore.instance
              .collection('Parteners')
              .where('email',
                  isEqualTo: FirebaseAuth.instance.currentUser!.email)
              .get()
              .then((QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
              documentIdd = querySnapshot.docs.first.id;
              //Do something with the retrieved document ID
              print('## got doc ID = $documentIdd');
              querySnapshot.docs.first["points"];
              int myInt = int.parse(addpoints);
              int e = int.parse(querySnapshot.docs.first["points"]);
              int red = e + myInt;
              String z = red.toString();

              await FirebaseFirestore.instance
                  .collection("Parteners")
                  .doc(documentIdd)
                  .update({
                "points": z,
              });

              /// add your code here
            }
          });
          AwesomeDialog(
              context: context, title: "error", body: Text('Transfer success'))
            ..show();
        } else {
          AwesomeDialog(
              context: context, title: "error", body: Text('User Not Found'))
            ..show();

          // Document not found
        }
      });
    } else {
// Document not found
    }
  }

  void _submitForm() {
    _textFieldController1.clear();
    _textFieldController2.clear();
  }

  void PartenerDocs() async {
    var formdata = partenerhawk.currentState;

    if (formdata!.validate()) {
      formdata.save();

      String documentId = '';
      FirebaseFirestore.instance
          .collection('Parteners')
          .where(
            'email',
            isEqualTo: FirebaseAuth.instance.currentUser!.email,
          )
          .get()
          .then((QuerySnapshot querySnapshot) async {
        if (querySnapshot.docs.isNotEmpty) {
          documentId = querySnapshot.docs.first.id;
          // Do something with the retrieved document ID
          print('## got doc ID = $documentId');
          querySnapshot.docs.first["points"];
          int myInt = int.parse(addpoints);
          int e = int.parse(querySnapshot.docs.first["points"]);
          int red = e + myInt;
          String z = red.toString();

          /// add your code here
          await FirebaseFirestore.instance
              .collection("Parteners")
              .doc(documentId)
              .update({
            "points": z,
          });

          AwesomeDialog(
              context: context, title: "error", body: Text('Transfer success'))
            ..show();
        } else {
          AwesomeDialog(
              context: context, title: "error", body: Text('User Not Found'))
            ..show();

          // Document not found
        }
      });
    } else {
// Document not found
    }
  }

  void PartenesPoints() async {
    var formdata = partenerhawk.currentState;

    if (formdata!.validate()) {
      formdata.save();
      String documentId = '';
      FirebaseFirestore.instance
          .collection('Parteners')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        if (querySnapshot.docs.isNotEmpty) {
          documentId = querySnapshot.docs.first.id;
          //Do something with the retrieved document ID
          print('## got doc ID = $documentId');
          querySnapshot.docs.first["points"];
          int myInt = int.parse(addpoints);
          int e = int.parse(querySnapshot.docs.first["points"]);
          int red = e + myInt;
          String z = red.toString();

          await FirebaseFirestore.instance
              .collection("Parteners")
              .doc(documentId)
              .update({
            "points": z,
          });

          /// add your code here
        }
      });
    } else {
// Document not found
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
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
        ],
      ),
      drawer: Drawer(

          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Container(
              child: FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance
                      .collection("Parteners")
                      .where("email",
                          isEqualTo: FirebaseAuth.instance.currentUser?.email)
                      .get(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: ((context, index) {
                            return ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              // Important: Remove any padding from the ListView.
                              padding: EdgeInsets.zero,
                              children: [
                               
                                
                                ListTile(
                                  leading: const Icon(Icons.history_outlined),
                                  title: Text('"Historiques"'),
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
                                  leading: const Icon(Icons.new_releases),
                                  title: const Text('Liste des commandes'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                historiqueItesUser()));
                                  },
                                ),
                              ],
                            );
                          }));
                    }
                    return CircularProgressIndicator();
                  }))),
        ],
      )),
      body: Form(
        key: partenerhawk,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _textFieldController1,
                  onSaved: (val) {
                    addemail = val!;
                  },
                  validator: ((val) {
                    if (val!.length > 100) {
                      return "email can't be larged than 100 letter";
                    }
                    if (val.length < 7) {
                      return "email verfied";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                    labelText: '  e-mail',
                    suffixIcon: Icon(Icons.people),
                    floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: (BorderSide(width: 1.0, color: Colors.black)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: (BorderSide(width: 1.0, color: Colors.green)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _textFieldController2,
                  onSaved: (vals) {
                    addpoints = vals!;
                  },
                  validator: ((val) {
                    if (val!.length > 8) {
                      return "points can't be larged than 10000";
                    }
                    if (val.length < 1) {
                      return "points Transfered";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                    labelText: '  nombre de points',
                    suffixIcon: Icon(Icons.point_of_sale),
                    floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: (BorderSide(width: 1.0, color: Colors.black)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: (BorderSide(width: 1.0, color: Colors.green)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.075,
                child: ElevatedButton(
                  onPressed: () {
                    PartenerDoc();
                    PartenesPoints();
                    _submitForm();
                    PartenerDocs();
                    setState(() {});
                  },
                  child: Text(
                    ' Transfert',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'DelaGothic'),
                  ),
                  style: ElevatedButton.styleFrom(
                      enableFeedback: false,
                      elevation: 10,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
