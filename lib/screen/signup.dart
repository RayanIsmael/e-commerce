import 'dart:ui';
import 'package:e_commerce/provider/provider1.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    var name, email, password;
    double height = MediaQuery.of(context).size.height;
    ////// Validator
    /////////////////////////////////
    ///////////////////
    ////////////////////////////////
    logup() async {
      var progress = Provider.of<ModalProgress>(context, listen: false);
      var formdata = formkey.currentState;
      if (formdata!.validate()) {
        formdata.save();
        /////////////////////////////
        try {
          progress.change(true);
          // ignore: unused_local_variable
          UserCredential userCredential = await auth
              .createUserWithEmailAndPassword(email: email, password: password);
          ////////// Save name and email in firestore
          // await FirebaseFirestore.instance
          //     .collection('users')
          //     .add({"username": name, "email": email});
          //////////////////////////////
          progress.change(false);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Home(),
          ));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            progress.change(false); //to close AlertDialog
            ////////////////////////////
            var snackbar = SnackBar(
              content: Text("The password provided is too weak."),
              duration: Duration(seconds: 1),
            );
            // ignore: deprecated_member_use
            scaffoldkey.currentState!.showSnackBar(snackbar);
            ///////////////////////////
          } else if (e.code == 'email-already-in-use') {
            progress.change(false);
            ////////////////////////////
            var snackbar = SnackBar(
              content: Text("The account already exists for that email."),
              duration: Duration(seconds: 1),
            );
            // ignore: deprecated_member_use
            scaffoldkey.currentState!.showSnackBar(snackbar);
            ///////////////////////////
          } else if (e.code == 'invalid-email') {
            progress.change(false);
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
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModalProgress>(context).modalhub,
          child: ListView(
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
                            name = newValue!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) return "Empty";
                            if (value.length < 5) return "Wrong Value";
                            return null;
                          },
                          /////////////
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          /////
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
                            email = newValue!;
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
                            password = newValue!;
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
          ),
        ));
  } //build

}
