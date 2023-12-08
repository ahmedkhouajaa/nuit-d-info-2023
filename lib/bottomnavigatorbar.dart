import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet/Roles.dart';
import 'package:planet/chatgpt.dart';

import 'package:planet/donnation/donnationscrren.dart';

import 'package:planet/fooddonnation/food.dart';
import 'package:planet/items.dart';

import 'package:planet/maps.dart';
import 'package:planet/news/newsscreen.dart';
import 'package:planet/profile/profile_screen.dart';


import 'package:planet/shopping.dart';
import 'package:planet/switchscree.dart';
import 'package:planet/transfert.dart';

import 'addnewitemUsers.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Dashbordscreen(),
   // Donationscreen(),
    Shop(),
    AddNewItemUser(),
  

    //  MyHomePage(title: "title"),
    //  MyHomePage(title: "title"),
    //  MyHomePage(title: "title"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  backgroundColor: Colors.green, actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RoleSelectionScreen()));
              },
            ),
          ],),
      
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
                                     
                                     Container(  
                                      padding: EdgeInsets.only(left: 20,top:50 ),
                                      alignment: Alignment.topLeft,
                                      height: 150, child: Column(children: [
                                      Text("Full Name : "  "${snapshot.data!.docs[index]['FullName']}",style: TextStyle(fontSize: 17),),
                                       SizedBox(height: 10,),
                                      
                                      Text("Email : " "${snapshot.data!.docs[index]['useremail']}",style: TextStyle(fontSize: 17)),
                                      SizedBox(height: 10,),
                                       Text( "Ponits : " "${snapshot.data!.docs[index]['Points']}",style: TextStyle(fontSize: 17)),

                                     ],),
                                      
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                      ),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.person_pin),
                                      title: const Text('Profile'),
                                      onTap: () {
                                        // Update the state of the app
                                        // ...
                                        // Then close the drawer
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileScreen()));
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.map),
                                      title:  Text('Map'),
                                      onTap: () {
                                        // Update the state of the app
                                        // ...
                                        // Then close the drawer
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Maps()));
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.wb_sunny_outlined),
                                      title: const Text('ChatGpt'),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ChatGpt()));
                                      },
                                    ),
                                 
                                   
                                    ListTile(
                                      leading: const Icon(
                                          Icons.production_quantity_limits),
                                      title: const Text('iteams'),
                                      onTap: () {
                                        // Update the state of the app
                                        // ...
                                        // Then close the drawer
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Iteams()));
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
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            label: 'Add New Item',
          ),
         
        
         
          //    BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //    label: 'Home',
          //   ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 3, 193, 12),
        unselectedItemColor: Color.fromARGB(255, 1, 3, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
