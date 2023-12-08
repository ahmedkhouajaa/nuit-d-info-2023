import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planet/partenershisorique.dart';

import 'historiquesofpartener.dart';

class Historiques extends StatelessWidget {
  final notess;
  final docids;
  Historiques({this.notess, this.docids});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Command List"),
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(

            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
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
                                builder: (context) => AdminPartener()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        )),
        body: Container(
            child: FutureBuilder<QuerySnapshot>(
                future:
                    FirebaseFirestore.instance.collection("NewComand").get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.green[800],
                                  borderRadius: BorderRadius.circular(13),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                        offset: Offset(3, 4))
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 30),
                                      child: Row(
                                        children: [
                                          Column(),
                                          SizedBox(
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                        onTap: () {
                                          // Navigate to Next Details
                                        },
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(height: 10),
                                            const Icon(Icons.person,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['clientName']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.phone_android,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['clientaddress']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.location_on,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['phoneNumber']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.comment,
                                                color: Colors.black, size: 30),
                                            const SizedBox(height: 10),
                                            Text(
                                              "Le Produit :  ${snapshot.data!.docs[index]['ProductName']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        )),
                                    ////   if (Text(
                                    //          "${snapshot.data!.docs[index]['calimtitleck1']}") ==
                                    //        null)
                                    //       Text("data wait")
                                    //     else

                                    //     if ( teckrec == null)  Text("redd")
                                    //   else (Text( "${snapshot.data!.docs[index]['clientName']}"))
                                  ],
                                ),
                              ),
                            ],
                          );
                        }));
                  }
                  return CircularProgressIndicator();
                }))));
  }
}
