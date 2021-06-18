import 'package:e_commerce/conponent/textformfirld.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  FirebaseAuth auth = FirebaseAuth.instance;
  Future startapp() async {
    auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login(),
        ));
      } else {
        print("okkk");
      }
    });
  }

  @override
  void initState() {
    startapp();
    super.initState();
  }

/////*************************************/////
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.amber,
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: Text('Admin Page'),
        titleSpacing: 2,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await auth.signOut();
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      //////////////////
      body: ListView(
        children: [
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: media*0.1,
                ),
                /////
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MyTextForm(hint: "name", icon: Icons.production_quantity_limits),
                ),
                //
                SizedBox(
                  height: media*0.02,
                ),
                //////
                
              ],
            ),
          ),
        ],
      ),
      /////////////////
    );
  }
}
