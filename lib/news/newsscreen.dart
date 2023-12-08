import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'newscard.dart';

class Dashbordscreen extends StatefulWidget {
  const Dashbordscreen({super.key});

  @override
  State<Dashbordscreen> createState() => _DashbordscreenState();
}

CollectionReference notees = FirebaseFirestore.instance.collection("notes");

class _DashbordscreenState extends State<Dashbordscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Text('NEWS',
                  style: TextStyle(
                      fontFamily: "League",
                      fontSize: 23,
                      fontWeight: FontWeight.bold)),
              Container(height: 1,
                  child: FutureBuilder<QuerySnapshot>(
                      future: notees.get(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            
                              reverse: true,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                    width: double.infinity,
                                    height: 350,
                                    padding: EdgeInsets.only(top: 15),
                                    child: Column(children: [
                                      Container(
                                        height: 203,
                                        width: 500,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color(0xff707070),
                                            
                                          ),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  " ${snapshot.data!.docs[index]['image']}"),
                                              ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(11),
                                                  color: Colors.black
                                                      .withOpacity(0.33),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                                child: Center(
                                                  child: Text(
                                                    " ${snapshot.data!.docs[index]['notes']}",
                                                    style: TextStyle(
                                                        fontFamily: "Avenir",
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                    maxLines: 3,
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          " ${snapshot.data!.docs[index]['notes']}",
                                          style: TextStyle(
                                              fontFamily: "Times",
                                              fontSize: 13,
                                              color: Color(0xff8a8989))),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                          " ${snapshot.data!.docs[index]['title']}",
                                          style: TextStyle(
                                              fontFamily: "League",
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold)),
                                    ]));
                              }));
                        }
                        return CircularProgressIndicator();
                      }))),
               //        NewsCard(
             //   time: "31 mai 18:39",
             //   imageUrl: "images/recycle.png",
             ////   title:
             //       " the earth with us",
            //    subtitle:
             //       "descreption here",
           //   ),
              NewsCard(
                time: "26 feb  08:39",
                imageUrl: "images/n2.png",
                title:
                    " New study shows the devastating impact of plastic pollution on marine life",
                subtitle:
                    "Scientists call for urgent action to reduce plastic waste and protect our oceans",
              ),
              NewsCard(
                time: "25 feb  09:19",
                imageUrl: "images/n3.png",
                title: " Australia experiences worst wildfires in decades",
                subtitle:
                    "Climate change and deforestation are contributing to the increasing frequency and severity of wildfires around the world",
              ),
              NewsCard(
                time: "25 feb  11:22",
                imageUrl: "images/red.png",
                title:
                    "Major cities around the world implement green infrastructure to combat climate change",
                subtitle:
                    "Cities are investing in sustainable infrastructure to reduce carbon emissions and create more livable urban environments",
              )
            ],
          )
        ],
      ),
    );
  }
}
// ListView(
      
  //    shrinkWrap: true ,
    //  scrollDirection: Axis.vertical,
  //    children: [Text('NEWS',style :TextStyle(
    //              fontFamily: "League",
   //               fontSize: 23,
    ///              fontWeight: FontWeight.bold)),NewsCard(), NewsCard(
     //               time: "26 feb  08:39",
      //              imageUrl: "images/n2.png",
//  title:" New study shows the devastating impact of plastic pollution on marine life",
//subtitle: "Scientists call for urgent action to reduce plastic waste and protect our oceans",

  //                ), NewsCard(
   /////                  time: "25 feb  09:19",
   //                 imageUrl: "images/n3.png",
// title:" Australia experiences worst wildfires in decades",
 // subtitle: "Climate change and deforestation are contributing to the increasing frequency and severity of wildfires around the world",

   //               ), NewsCard(
     //                time: "25 feb  11:22",
       //             imageUrl: "images/red.png",
         //           title: "Major cities around the world implement green infrastructure to combat climate change",
           //         subtitle: "Cities are investing in sustainable infrastructure to reduce carbon emissions and create more livable urban environments",
             //     )],
   // )