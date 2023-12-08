import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:planet/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var points = "0";
  var useremail, passsword , fullname;
  GlobalKey<FormState> redhawkkk = new GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  usersinfo() async {
    await users.add({
      "FullName" : fullname,
      "Points": points,
      "useremail": useremail,
      "userId": FirebaseAuth.instance.currentUser!.uid,
    });
  }

  signup() async {
    var formdata = redhawkkk.currentState;

    if (formdata!.validate()) {
      formdata.save();

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: useremail,
          password: passsword,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
            AwesomeDialog(
              context: context, title: "error", body: Text('The password provided is too weak.'))
            ..show();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
           AwesomeDialog(
              context: context, title: "error", body: Text('The account already exists for that email.'))
            ..show();
          print('The account already exists for that email.');
        }
      } catch (e) {
          AwesomeDialog(
              context: context, title: "error", body: Text("$e"))
            ..show();
        print(e);
      }
    } else {
      print('vvvv');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: redhawkkk,
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                //   Container(
                //    decoration: BoxDecoration(
                //     color: Colors.black12
                //    )
                //    ,

                //      child: Image.asset('images/gifs/splash_image.gif')
                //      ),
                Container(
                  margin: EdgeInsets.only(top: 100, left: 15),
                  width: double.infinity,
                  child: Text(
                    'WELCOME\nLet\'s Start ',
                    style: TextStyle(
                      fontFamily: 'Bowlby',
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (Value) {
                      fullname = Value;
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
                      labelText: 'Ful Name',
                      suffixIcon: Icon(Icons.person),
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
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (Value) {
                      useremail = Value;
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
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (Value) {
                      passsword = Value;
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
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.remove_red_eye),
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
                            (BorderSide(width: 1.0, color: Colors.blue)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: ElevatedButton(
                    onPressed: () async {
                      var usered = await signup();
                      if (usered != null) {
                        await usersinfo();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginScreen())));
                      }
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'DelaGothic'),
                    ),
                    style: ElevatedButton.styleFrom(
                        enableFeedback: false,
                        elevation: 20,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void sign() {
    Navigator.pop(context);
  }
}
