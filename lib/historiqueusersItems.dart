import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet/addPoints.dart';

CollectionReference Items = FirebaseFirestore.instance.collection("New Items");

class historiqueItesUser extends StatefulWidget {
  historiqueItesUser({super.key});

  @override
  State<historiqueItesUser> createState() => _historiqueItesUserState();
}

class _historiqueItesUserState extends State<historiqueItesUser> {
  @override
  String location = '';
  List<DocumentSnapshot> filteredData = [];
  void filterDataByLocation(String location) {
    FirebaseFirestore.instance
        .collection('New Items')
        .where('address', isEqualTo: location)
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        filteredData = snapshot.docs;
      });
    }).catchError((error) => print('Error fetching data: $error'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        
        appBar: AppBar(
          title: const Text('Iems Historique'),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            SizedBox(height: 30,),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  location = value;
                });
                filterDataByLocation(location);
                
              },
              decoration:
                InputDecoration(
                  fillColor: Colors.green[50],
                  filled: true,
                  hintText: ' Filter',
                  labelText: "Filter",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
             
            ),
            Column(
              children: [
                Container(
                    child: FutureBuilder<QuerySnapshot>(
                        future: Items.get(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: filteredData.length,
                                itemBuilder: ((context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF027D2D),
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
                                        Container(padding: EdgeInsets.only(left: 70),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "  ${filteredData[index]['Date']}",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                            //     Text(
                                              //  "  ${filteredData[index]['Time']}",
                                             //   style: const TextStyle(
                                              //      fontSize: 20,
                                              //      color: Colors.black),
                                            //  ),
                                           
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          onTap: () {
                                            // Navigate to Next Details
                                          },
                                          trailing: const Icon(Icons.arrow_forward,
                                              color: Colors.black, size: 39),
                                          title: Container(
                                            height: 35,
                                            child: Text(
                                              "address : ${filteredData[index]['address']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 10),
                                                child: Text(
                                                  "full name : ${filteredData[index]['full name']}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 10),
                                                child: Text(
                                                  "phone : ${filteredData[index]['phone']}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: 200,
                                                padding:
                                                    const EdgeInsets.only(top: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Color(0xff707070),
                                                    width: 1,
                                                  ),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${filteredData[index]['image']}"),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }));
                          }
                          return CircularProgressIndicator();
                        }))),
              ],
            ),
          ],
        ));
  }
}
