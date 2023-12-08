import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:planet/donnation/donnationcard.dart';

class Donationscreen extends StatefulWidget {
  const Donationscreen({super.key});

  @override
  State<Donationscreen> createState() => _DonationscreenState();
}

class _DonationscreenState extends State<Donationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor:  Colors.green[100],
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          HomePageCard(),
          HomePageCard( title: "With environmental issues such as climate change, deforestation, and pollution threatening the health and wellbeing of our ecosystems", prix: "25000 Points", titileper: "55", percent: 0.55,donnateur:  "220 Donnateurs",imageUrl: "images/pol2.png"),
          HomePageCard( title: "Your donation can help create a healthier and more sustainable future for all of us,", prix: "330000 points", titileper: "70", percent: 0.7,donnateur: "340 Donnateurs",imageUrl: "images/pol3.png"),
        ],
      ),
    );
  }
}