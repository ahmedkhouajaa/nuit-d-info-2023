import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:planet/command.dart';
import 'package:planet/command2.dart';
import 'package:planet/command3.dart';
import 'package:planet/command4.dart';
import 'package:planet/counterdown.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
     
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
         
            
            GestureDetector(
              onTap: () {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Command1())));
              },
              child: FittedBox(
                child: Card(
                   color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Row(
                    children: <Widget>[
                      pizzaitem(),
                      Container(
                        width: 90,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            fit: BoxFit.cover,
                            alignment: Alignment.topRight,
                            image: AssetImage('images/product3.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Command2())));
              },
              child: FittedBox(
                child: Card(
                   color:Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Row(
                    children: <Widget>[
                      eliteitem(),
                      Container(
                        width: 90,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            fit: BoxFit.cover,
                            alignment: Alignment.topRight,
                            image: AssetImage('images/product4.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Command3())));
              },
              child: GestureDetector(
                onTap: () {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Command4())));
              },
                child: FittedBox(
                  child: Card(
                     color:Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        juiceitem(),
                        Container(
                          width: 90,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              fit: BoxFit.cover,
                              alignment: Alignment.topRight,
                              image: AssetImage('images/product2.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
               Hero(
              tag: "cakeitem",
              child: FittedBox(
                child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        itemcake(),
                        Container(
                          width: 90,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              fit: BoxFit.cover,
                              alignment: Alignment.topRight,
                              image: AssetImage('images/product1.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemcake() {
    return Container(
      //width: 150,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Tablet 5 Gen",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "10000 Points",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9.5,
                color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text("shop now")
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Ratings",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 7,
                    color: Colors.black),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget juiceitem() {
    return Container(
      //width: 150,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Smart Phone",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "7500 Points",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9.5,
                color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text("shop now")
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Ratings",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 7,
                    color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pizzaitem() {
    return Container(
      //width: 150,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Kit Bluetooth   ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "1000 Points",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9.5,
                color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text("shop now")
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Ratings",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 7,
                    color: Colors.black),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget eliteitem() {
    return Container(
      //width: 150,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Smart Watch",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "2500 Points",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9.5,
                color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text("shop now")
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Ratings",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 7,
                    color: Colors.black),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}