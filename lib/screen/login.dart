import 'dart:ui';
import 'package:e_commerce/provider/provider1.dart';
import 'package:e_commerce/screen/admin.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/screen/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email, password;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  GlobalKey<FormState> formkey = GlobalKey();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    ///////////////////////
    ///////////////////
/////////////////////////login
    mylogin() async {
      var progress = Provider.of<ModalProgress>(context, listen: false);
      var formatdata = formkey.currentState;
      if (formatdata!.validate()) {
        formatdata.save();
        ///////////////////////////
        try {
          progress.change(true);
          await auth.signInWithEmailAndPassword(
              email: email, password: password);

          progress.change(false);
          if (email == "rayan1998@gmail.com" && password == "NuttertoolS") {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Admin(),
            ));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Home(),
            ));
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            progress.change(false);
            ////////////////////////////
            var snackbar = SnackBar(
              content: Text("No user found for that email."),
              duration: Duration(seconds: 1),
            );

            scaffoldkey.currentState!
                // ignore: deprecated_member_use
                .showSnackBar(snackbar);
            ///////////////////////////
          } else if (e.code == 'wrong-password') {
            progress.change(false);
            ////////////////////////////
            var snackbar = SnackBar(
              content: Text("Wrong password provided for that user."),
              duration: Duration(seconds: 1),
            );

            scaffoldkey.currentState!
                // ignore: deprecated_member_use
                .showSnackBar(snackbar);
            ///////////////////////////
          } else if (e.code == 'invalid-email') {
            progress.change(false);
            ////////////////////////////
            var snackbar = SnackBar(
              content: Text("invalid-email"),
              duration: Duration(seconds: 1),
            );

            scaffoldkey.currentState!
                // ignore: deprecated_member_use
                .showSnackBar(snackbar);
            ///////////////////////////
          }
        }
        ///////////////////////////
      } else {
        print("Un Valid");
      }
    }

///////////////////////
///////////////////////
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
              Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /////filed email/////
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          ///////Validator//////
                          onSaved: (newValue) {
                            email = newValue;
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
                              )),
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
                            password = newValue;
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
                      //////
                    ],
                  )),
              SizedBox(
                height: height * 0.05,
              ),
              /////login Button/////
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: InkWell(
                    onTap: () {
                      mylogin();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: Colors.black,
                      ),
                      child: Text(
                        'Login',
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
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Signup(),
                      ));
                    },
                    child: Text(
                      "Logn Up",
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
  }
}
