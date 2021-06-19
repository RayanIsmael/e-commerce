import 'package:e_commerce/screen/admin.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  FirebaseAuth auth = FirebaseAuth.instance;
  startapp() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login(),
        ));
      } else {
        if (auth.currentUser!.email == "rayan1998@gmail.com") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Admin(),
          ));
        } else {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
        }
      }
    });
  }

  @override
  void initState() {
    if(mounted){
    startapp();

    }
    super.initState();
  }
/////*************************************/////

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
