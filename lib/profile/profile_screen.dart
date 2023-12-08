import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: 
        
        ListView(
            scrollDirection: Axis.vertical,
        shrinkWrap: true,
            children: [
              Container(
                
                  child: FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection("users")
                          .where("userId",
                              isEqualTo: FirebaseAuth.instance.currentUser?.uid)
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
                                     Container(padding: EdgeInsets.only(left: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/avatar.png"),
                    ),
                    Positioned(
                      right: -16,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(color: Colors.white),
                            ),
                            primary: Colors.white,
                            backgroundColor: Color(0xFFF5F6F9),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Full Name : "  "${snapshot.data!.docs[index]['FullName']}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Email : ""${snapshot.data!.docs[index]['useremail']}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Points : ""${snapshot.data!.docs[index]['Points']}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           
          ]),
        )
                                    ]);
                                   
                              }));
                        }
                        return CircularProgressIndicator();
                      }))),
            ],
          )
        );
  }
}
