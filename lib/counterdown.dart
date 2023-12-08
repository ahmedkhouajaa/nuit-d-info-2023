import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';






///
/// Test app
///
class MysApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Countdown',
      ),
    );
  }
}

///
/// Home page
///
class MyHomePage extends StatefulWidget {
  ///
  /// AppBar title
  ///
  final String title;

  /// Home page
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

///
/// Page state
///
class _MyHomePageState extends State<MyHomePage> {
  // Controller
  final CountdownController _controller =
      new CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.cyan[100],
      body: 
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Column(
              children: [
                
                SizedBox(height: 15,),
                Text(" le 01/12 ?? ",style: TextStyle(fontSize: 18),),
                SizedBox(height: 5,),
                Text("ca te dit quelque chose ??",style: TextStyle(fontSize: 18),)
              ],
            ),
            SizedBox(width: 50,),
            Countdown(
              
              // controller: _controller,
              seconds: 120,
              build: (_, double time) => Text(
                time.toString(),
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              interval: Duration(milliseconds: 100),
              onFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Timer is done!'),

                  ),
                  
                );
              //   Navigator.push(
               //           context,
               //           MaterialPageRoute(
                //              builder: (context) => Firstscreen()));
              },
            ),
          ],
        ),
      );
    
  }
}