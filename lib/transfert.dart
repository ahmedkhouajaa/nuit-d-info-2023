

import 'package:flutter/material.dart';


class Transfert extends StatefulWidget {
  const Transfert({super.key});

  @override
  State<Transfert> createState() => _TransfertState();
}

class _TransfertState extends State<Transfert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text("transfert"),backgroundColor: Colors.green),
      body : 
    
      
     Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
       
       children: [
        Row(
          children: [
            Container(
              margin:  EdgeInsets.only(left: 20,top: 200),
              decoration: BoxDecoration(boxShadow:[BoxShadow(blurRadius: 50)]),

              child: CircleAvatar(
                radius: 45,
              backgroundColor: Color.fromARGB(255, 123, 202, 143),
              child: Text('Points',style: TextStyle(fontWeight:FontWeight.bold))
            ),
            ),
             Padding(
              padding:  EdgeInsets.only(left: 60,top: 200),
              child: 
               Icon(Icons.arrow_forward,size: 50),
            ),
            
            
             Container(
              margin: const EdgeInsets.only(left: 60,top: 200),
              decoration: BoxDecoration(boxShadow:[BoxShadow(blurRadius: 50)]),
              child: CircleAvatar(
                radius: 45,
              backgroundColor:Color.fromARGB(255, 123, 202, 143),
              child: Text("DT",style: TextStyle(fontWeight:FontWeight.bold),)
            ),
            ),
            
     
          ],
        
          
        ),
        SizedBox(height: 80,),
        SizedBox(
          width: 120,
          child: TextField(
            
          decoration: InputDecoration(
            
            
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(),
            
            hintText: 'Points',
          ),
          
        ),
        ),
        SizedBox(height: 20,),
        Text(" Transfert To "),
        SizedBox(height: 20,),
        SizedBox(
          width: 200,
          child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(),
            hintText: ' Dt'
          ),
          
        ),
        ),
       ],
     
       
     
         ),
     ));
  }
}