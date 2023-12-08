import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Iteams extends StatefulWidget {
  const Iteams({super.key});

  @override
  State<Iteams> createState() => _IteamsState();
}

class _IteamsState extends State<Iteams> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

body: Center(child: Container(
  
  padding: EdgeInsets.only(left: 30,right: 30),
  child: Image.asset("images/list.png"),
  
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(80)
  ),
  ))

    );
  }
}