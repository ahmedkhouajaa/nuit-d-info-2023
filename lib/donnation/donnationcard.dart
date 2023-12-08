import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePageCard extends StatelessWidget {
  final imageUrl, title, prix, donnateur,percent , titileper;

  const HomePageCard(
      {this.imageUrl = "images/pol1.png",
      this.title =
          "Donating to environmental causes is one of the most effective ways to make a positive impact on our planet",
      this.prix = "100000 points",
      this.donnateur = "419 Donnateurs ",
      this.percent = 0.4,
      this.titileper = "40"
      });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 450,
        width: double.infinity,
        color: Color.fromARGB(255, 218, 203, 157),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xff707070),
                  width: 1,
                ),
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //  Text("",
            //    style: TextStyle(
            //      fontFamily: "Times", fontSize: 13, color: Color(0xff8a8989))),
            SizedBox(
              height: 7,
            ),
            Text(title,
                style: TextStyle(
                    fontFamily: "League",
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
               SizedBox(height: 8,),
            Container(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 15,
                ),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 7.0,
                  animationDuration: 2000,
                  percent: percent,
                  center: Text(
                    titileper,
                    style: TextStyle(fontSize: 7, color: Colors.white),
                  ),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.black,
                ),
              ),
            ),
            
            Text("OBJECTIF"),
            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(right: 60),
              child: Row(
                children: [
                  Container(
                      
                      child: Text(prix,
                          style: TextStyle(
                              fontFamily: "League",
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    width: 60,
                  ),
                  
                      Row(
                        children: [
                          Text(donnateur,
                              style: TextStyle(
                                  fontFamily: "League",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                              
                        ],
                      ),
                    ],
                  
               
              ),
            )
          ],
        ),
      ),
    );
  }
}
