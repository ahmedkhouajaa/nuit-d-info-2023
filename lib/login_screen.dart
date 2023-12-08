import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:planet/addPoints.dart';
import 'package:planet/amindashbord.dart';
import 'package:planet/bottomnavigatorbar.dart';
import 'package:planet/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usersemail, userspassword;
  GlobalKey<FormState> redhawks = new GlobalKey<FormState>();

  signinuser() async {
    var formdata = redhawks.currentState;
    if (formdata!.validate()) {
      formdata.save();
      String documentId = '';
      FirebaseFirestore.instance
          .collection('Parteners')
          .where('email', isEqualTo: usersemail)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        if (querySnapshot.docs.isNotEmpty) {
          documentId = querySnapshot.docs.first.id;
          //Do something with the retrieved document ID
          print('## got doc ID = $documentId');
          print("${FirebaseAuth.instance.currentUser!.email} ");
          await FirebaseFirestore.instance
              .collection("Parteners")
              .doc(documentId)
              .update({
            "userId": FirebaseAuth.instance.currentUser!.email,
          });
          print(FirebaseAuth.instance.currentUser!.email);

          /// add your code here
        }
      });
      print("mrigel");
      try {
        UserCredential userre = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: usersemail, password: userspassword);
        return userre;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          //  AwesomeDialog(
          //        context: context, title: "error", body: Text('No user found for that email.'))..show();

          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          ///   AwesomeDialog(
          //         context: context, title: "error", body: Text('Wrong password provided for that user.'))..show();
          print('Wrong password provided for that user.');
        }
      }
    }
    return CircularProgressIndicator();
  } // else {

  //AwesomeDialog(
  //    context: context,
  //    title: 'error',
  //  body: Text("Wrong password provided for that user."))
  //  ..show;
  // }
  // }
  var fbm = FirebaseMessaging.instance;
  @override
  void initState() {
    fbm.getToken().then((value) => print(value));
    super.initState();
  }

  final number = TextEditingController();
  final password = TextEditingController();
  bool showpass = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    //  Center(
                    ///   child: Container(
                    //    child: Image.asset('images/gifs/splash_image.gif'),
                    //  ),
                    //   ),
                  ],
                ),
              ),
            ),
            Form(
              key: redhawks,
              child: Expanded(
                flex: 5,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 15),
                        width: double.infinity,
                        child: Text(
                          'WELCOME\nBACK ! ',
                          style: TextStyle(
                            fontFamily: 'Bowlby',
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.aspectRatio * 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onSaved: (Value) {
                            usersemail = Value;
                          },
                          validator: ((Value) {
                            if (Value!.length > 100) {
                              return "email can't be larged than 100 letter";
                            }
                            if (Value.length < 7) {
                              return "email can't be less than 2 letter";
                            }
                            return null;
                          }),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'E-mail Address',
                            suffixIcon: Icon(Icons.mail_outline),
                            floatingLabelStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.black)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.blue)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onSaved: (val) {
                            userspassword = val;
                          },
                          validator: ((val) {
                            if (val!.length > 100) {
                              return "email can't be larged than 100 letter";
                            }
                            if (val.length < 7) {
                              return "email can't be less than 2 letter";
                            }
                            return null;
                          }),
                          obscureText: showpass ? false : true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: showpass
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.remove_red_eye),
                            floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.black)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.green)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Checkbox(
                              splashRadius: 30,
                              side: BorderSide(width: 2),
                              activeColor: Colors.green,
                              value: showpass,
                              onChanged: (newval) {
                                setState(() {
                                  showpass = newval!;
                                });
                              },
                            ),
                            Text(
                              'Show Password',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      showpass ? Colors.green : Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 6),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => SignUp())));
                              },
                              child: Text(
                                'SIGN UP>>',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 22,
                                    decoration: TextDecoration.underline),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  shadowColor: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.075,
                            child: ElevatedButton(
                              onPressed: () async {
                                var rrr = await signinuser();

                                if (rrr != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              MyStatefulWidget())));
                                }
                              },
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'DelaGothic'),
                              ),
                              style: ElevatedButton.styleFrom(
                                  enableFeedback: false,
                                  elevation: 10,
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logg() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void sign() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
}
