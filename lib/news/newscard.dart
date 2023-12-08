import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final imageUrl, title, subtitle, time;

  const NewsCard(
      {this.imageUrl = "images/n1.png",
      this.title = "Record-breaking heatwave sweeps across Western US",
      this.time = "26 feb  07:19",
      this.subtitle =
          "Experts warn of the dangerous effects of climate change on the environment and human health."});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 350,
        padding: EdgeInsets.only(top: 15),
        child: Column(children: [
          Container(
            height: 203,
            width: 500,
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
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.black.withOpacity(0.33),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Center(
                      child: Text(
                        subtitle,
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
            height: 10,
          ),
          Text(time,
              style: TextStyle(
                  fontFamily: "Times", fontSize: 13, color: Color(0xff8a8989))),
          SizedBox(
            height: 7,
          ),
          Text(title,
              style: TextStyle(
                  fontFamily: "League",
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
        ]));
  }
}
// MediaQuery.of(context).size.width
