import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:planet/fooddonnation/addinfo.dart';

import 'donnationmodel.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
 String noneImage =
      'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png';

  //List of rescues
  List<Rescue> rescues = [
    Rescue(
      saverName: ' Orange',
      peopleNumber: 9,
      peopleNames: 'ines, walid, jilani',
      boatName: 'Titanic',
      description: 'Distance : 3.6 Km',
      rescueDate: '15/01/2019',
      images: 'images/orange.png',
      phone: "27755999"
    ),
    Rescue(
      saverName: 'Tomato',
      peopleNumber: 4,
      peopleNames: 'monsef, hamma, jilani',
      boatName: 'Tomato boat',
      description: 'Distance :2.1 Km',
      rescueDate: '06/07/2020',
      images:
          'images/tomato.png',
          phone: "54169779"
    ),
    Rescue(
      saverName: 'Green pepper',
      peopleNumber: 1,
      peopleNames: 'monther, amine, marwa',
      boatName: 'Titanic',
      description: 'Distance:0.9 Km',
      rescueDate: '17/11/2016',
      images:
          'images/Green pepper.png',
          phone: "95034192"
    ),
    Rescue(
      saverName: 'potato',
      peopleNumber: 6,
      peopleNames: 'potato',
      boatName: 'Titanic',
      description: 'Distance :1.2 Km',
      rescueDate: '20/10/2020',
      images:
          'images/potato.png',
          phone: "97221820"
    ),
    Rescue(
      saverName: 'carrot',
      peopleNumber: 2,
      peopleNames: 'rami, raed, anas',
      boatName: 'Titanic',
      description: 'Distance :1.8 Km',
      rescueDate: '29/05/2021',
      images:
          'images/carrot.png',
          phone: "20143163"
    ),
  ];

  Widget getRescueWidget(Rescue src) {
    return getRescueWidget(src);
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
//**********************************************
  Widget build(BuildContext context) {
    //the One getRescueWidget
    Widget getRescueWidget(Rescue rsc) {
      return Container(
        
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(
                rsc.images.toString() ,
                fit: BoxFit.cover,
              ),
            ),
            Stack(children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 270,
                                ),
                               
                                Text(rsc.peopleNumber.toString()),
                                SizedBox(width: 5,),
                                 Icon(Icons.remove_red_eye,
                                    color: Colors.black),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 240),
                    child: Row(
                      children: [
                        Text("Tel :", style: TextStyle(fontWeight: FontWeight.bold),),
                        Container(   child: Text(rsc.phone)),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(right: 4),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      (rsc.saverName ?? 'not available'),
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    (rsc.description ?? 'not available'),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Date :' + (rsc.rescueDate ?? 'not available'),
                  ),
                ],
              ),
            ]),
          ],
        ),
      );
    }

    //*********************************
    return Scaffold(
     backgroundColor: Colors.green[100],
      body: Container(
        child: ListView(
          children: [
           
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: rescues.length,
                itemBuilder: (context, i) {
                  return getRescueWidget(rescues[i]);
                },
              ),
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddInformation()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}