import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet/addPoints.dart';




CollectionReference ra =
    FirebaseFirestore.instance.collection("Translation historique");

class Histoique extends StatefulWidget {
  Histoique({super.key});

  @override
  State<Histoique> createState() => _HistoiqueState();
}

class _HistoiqueState extends State<Histoique> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        appBar: AppBar(
          title: const Text('Historique'),
          backgroundColor: Colors.green,
        ),
        body: Container(
            child: FutureBuilder<QuerySnapshot>(
                future: ra.get(),
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
                              color: Colors.green[700],
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
                                Center(
                                  child: Text(
                                      " ${snapshot.data!.docs[index]['day']}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                ),
                                  Center(
                                    child: Text(
                                      "${snapshot.data!.docs[index]['time']}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ListTile(
                                  onTap: () {
                                    // Navigate to Next Details
                                   
                                  },
                                  trailing: const Icon(Icons.arrow_forward,
                                      color: Colors.black, size: 39),
                                      
                                  title: Text(
                                    "email : ${snapshot.data!.docs[index]['useremail']}",
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
                                          "Points : ${snapshot.data!.docs[index]['Points']}",
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