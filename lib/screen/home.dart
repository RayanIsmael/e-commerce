import 'package:e_commerce/screen/admin.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  FirebaseAuth auth = FirebaseAuth.instance;
  
/////*************************************/////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('HOME PAGE'),
        titleSpacing: 2,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await auth
                    .signOut()
                    .whenComplete(() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),))
                    
                    )
                    .catchError((e) {
                  print(e);
                });
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
