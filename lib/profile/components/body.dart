import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
           ///   CircleAvatar(
           //     backgroundImage: AssetImage("images/ahmedkhouaja.png"),
           //   ),
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
                    child: Image.asset("images/ahmedkhouaja.png"),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
            decoration: InputDecoration(
          labelText: '  e-mail',
          suffixIcon: Icon(Icons.people),
        )),
        TextFormField(
            decoration: InputDecoration(
          labelText: '  numero',
          suffixIcon: Icon(Icons.numbers),
        )),
        TextFormField(
            decoration: InputDecoration(
          labelText: '  adresse',
          suffixIcon: Icon(Icons.local_activity),
        )),
      ]),
    );
  }
}
