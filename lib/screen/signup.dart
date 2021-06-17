import 'dart:ui';

import 'package:e_commerce/screen/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var name, email, password;
    double height = MediaQuery.of(context).size.height;
    ////// Validator
    void signupcheckqq() {
      var alldata = formkey.currentState;
      if (alldata!.validate()) {
        alldata.save();
        print(name);
        print(email);
        print(password);
      }
    }

    ////////
    return Scaffold(
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
                        autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                        autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                        autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                    signupcheckqq();
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
