import 'package:e_commerce/screen/addproducts.dart';
import 'package:e_commerce/screen/editeproducts.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Admin extends StatefulWidget {
  Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  var imageUlr;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  startapp(context) async {
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
    startapp(context);
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
      ///////////////
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddProducts(),
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.0),
                      color: Colors.black,
                    ),
                    child: Text(
                      'Add Products',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            //////////
            SizedBox(
              height: media * 0.05,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditeProducts(),
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.0),
                      color: Colors.black,
                    ),
                    child: Text(
                      'Edit Products',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            //////////
            SizedBox(
              height: media * 0.04,
            ),
          ],
        ),
      ),
      ////////////////
    );
  }
}
