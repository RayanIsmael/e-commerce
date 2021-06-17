import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
            /////filed email/////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
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
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(width: 2, color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    )),
              ),
            ),
            //////
            SizedBox(
              height: height*0.02,
            ),

            ///filed password///
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
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
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(width: 2, color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    )),
              ),
            ),
            //////
            SizedBox(
              height: height*0.05,
            ),
            /////login Button/////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: InkWell(
                  onTap: () {},
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
              height:  height*0.05,
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
                  onPressed: () {},
                  child: Text(
                    "LogUp",
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
  }
}
