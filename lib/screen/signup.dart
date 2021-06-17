import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/provider/provider1.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    var name, email, password;
    double height = MediaQuery.of(context).size.height;
    ////// Validator
    /////////////////////////////////
    //////////Alert Dialog////
    showDialog() {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.NO_HEADER, //more
        animType: AnimType.SCALE, //more
        body: Container(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            )),
        ////more....
      )..show();
    }

    ///////////////////
    ////////////////////////////////
    logup() async {
      var formdata = formkey.currentState;
      if (formdata!.validate()) {
        formdata.save();
        /////////////////////////////
        try {
          showDialog();
          // ignore: unused_local_variable
          UserCredential userCredential = await auth
              .createUserWithEmailAndPassword(email: email, password: password);
          ////////// Save name and email in firestore
          // await FirebaseFirestore.instance
          //     .collection('users')
          //     .add({"username": name, "email": email});
          //////////////////////////////
          //Navigator.of(context).pushReplacementNamed("HomePage");
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Navigator.of(context).pop(); //to close AlertDialog
            ////////////////////////////
            var snackbar = SnackBar(
              content: Text("The password provided is too weak."),
              duration: Duration(seconds: 1),
            );
            // ignore: deprecated_member_use
            scaffoldkey.currentState!.showSnackBar(snackbar);
            ///////////////////////////
          } else if (e.code == 'email-already-in-use') {
            Navigator.of(context).pop(); //to close AlertDialog
            ////////////////////////////
            var snackbar = SnackBar(
              content: Text("The account already exists for that email."),
              duration: Duration(seconds: 1),
            );
            // ignore: deprecated_member_use
            scaffoldkey.currentState!.showSnackBar(snackbar);
            ///////////////////////////
          } else if (e.code == 'invalid-email') {
            Navigator.of(context).pop(); //to close AlertDialog
            ////////////////////////////
            var snackbar = SnackBar(
              content: Text("invalid-email."),
              duration: Duration(seconds: 1),
            );
            // ignore: deprecated_member_use
            scaffoldkey.currentState!.showSnackBar(snackbar);
            ///////////////////////////
          }
        } catch (e) {
          Navigator.of(context).pop(); //to close AlertDialog
          print(e);
        }
        ////////////////////////////
      } else {
        ////////////////////////////
        var snackbar = SnackBar(
          content: Text("invalid-Input"),
          duration: Duration(seconds: 1),
        );
        // ignore: deprecated_member_use
        scaffoldkey.currentState!.showSnackBar(snackbar);
        ///////////////////////////
      }
    }

    /////////////////////////////
    //////////////////////////////

    ////////////////////////////
    return Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.amber,
        body: ListView(
          children: [
            /////image/////
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "images/icons/loginsecreen.png",
                      height: 100,
                      width: 100,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Text(
                        "Buy It",
                        style: TextStyle(
                            fontFamily: 'DancingScript',
                            fontSize: 25,
                            color: Colors.black87),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //////
            /////
            //////field fullname/////
            Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        ///////Validator//////
                        onSaved: (newValue) {
                          setState(() {
                            name = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) return "Empty";
                          if (value.length < 5) return "Wrong Value";
                          return null;
                        },
                        /////////////
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: Colors.amber,
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(
                              Icons.person_add_alt_1_rounded,
                              color: Colors.amber,
                            ),
                            fillColor: Colors.amber[100],
                            hintText: "Full Name",
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            )),
                      ),
                    ),
                    //////////
                    SizedBox(
                      height: height * 0.02,
                    ),
                    /////filed email/////
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        ///////Validator//////
                        onSaved: (newValue) {
                          setState(() {
                            email = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) return "Empty";
                          if (value.length < 5) return "Wrong Value";
                          return null;
                        },
                        /////////////
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: Colors.amber,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.amber,
                          ),
                          fillColor: Colors.amber[100],
                          hintText: "Email",
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                    ),
                    //////
                    SizedBox(
                      height: height * 0.02,
                    ),

                    ///filed password///
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        ///////Validator//////
                        onSaved: (newValue) {
                          setState(() {
                            password = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) return "Empty";
                          if (value.length < 5) return "Wrong Value";
                          return null;
                        },
                        /////////////
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: Colors.amber,
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(
                              Icons.lock_open_rounded,
                              color: Colors.amber,
                            ),
                            fillColor: Colors.amber[100],
                            hintText: "Password",
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            )),
                      ),
                    ),
                  ],
                )),
            //////
            /////
            /////
            SizedBox(
              height: height * 0.05,
            ),
            /////Signup Button/////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: InkWell(
                  onTap: () {
                    logup();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.0),
                      color: Colors.black,
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            ///////
            SizedBox(
              height: height * 0.05,
            ),
            ////text////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do have an account?",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            ///////////
          ],
        ));
  } //build

}
