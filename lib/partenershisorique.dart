import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet/addPoints.dart';

import 'Roles.dart';






class AdminPartener extends StatelessWidget {
  AdminPartener({super.key});
  CollectionReference ba =
    FirebaseFirestore.instance.collection("Parteners");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        
        appBar: AppBar(backgroundColor: Colors.green,
          
          title: const Text('Historique'),
         actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoleSelectionScreen(
                            
                          )));
            },
          ),
        ],
        ),
        body: Container(
            child: FutureBuilder<QuerySnapshot>(
                future: ba.get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color:  Colors.green[800],
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
                               
                                ListTile(
                                  onTap: () {
                                    // Navigate to Next Details
                                   
                                  },
                                  trailing: const Icon(Icons.arrow_forward,
                                      color: Colors.black, size: 39),
                                      
                                  title: Text(
                                    "email : ${snapshot.data!.docs[index]['email']}",
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Points : ${snapshot.data!.docs[index]['points']}",
                                          style: const TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }));
                  }
                  return CircularProgressIndicator();
                }))));
  }
}