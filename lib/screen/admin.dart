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
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
    var name, price, des, category;
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
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: media * 0.1,
                ),
                /////////////////////////////////////////
                ////////name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    ///////Validator//////
                    onSaved: (newValue) {
                      name = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) return "Name Is Empty";
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
                          Icons.shopping_bag_rounded,
                          color: Colors.amber,
                        ),
                        fillColor: Colors.amber[100],
                        hintText: "Product name",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 2, color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                  ),
                ),
                ///////height
                SizedBox(
                  height: media * 0.01,
                ),
                ////////price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    ///////Validator//////
                    onSaved: (newValue) {
                      price = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) return "Price Is Empty";
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
                          Icons.monetization_on_outlined,
                          color: Colors.amber,
                        ),
                        fillColor: Colors.amber[100],
                        hintText: "Product Price",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 2, color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                  ),
                ),
                ///////height
                SizedBox(
                  height: media * 0.01,
                ),
                ////////Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    ///////Validator//////
                    onSaved: (newValue) {
                      des = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) return "Description Is Empty";
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
                          Icons.text_format_rounded,
                          color: Colors.amber,
                        ),
                        fillColor: Colors.amber[100],
                        hintText: "Product Description",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 2, color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                  ),
                ),
                ///////height
                SizedBox(
                  height: media * 0.01,
                ),
                ////////Category
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    ///////Validator//////
                    onSaved: (newValue) {
                      category = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) return "Category Is Empty";
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
                          Icons.category_outlined,
                          color: Colors.amber,
                        ),
                        fillColor: Colors.amber[100],
                        hintText: "Product Category",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(width: 2, color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                  ),
                ),
                ///////////////////////////////////////////////////////Image

                ////////////////////////////////////////////////////////////
                SizedBox(
                  height: media * 0.02,
                ),
                /////login Button/////
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: InkWell(
                      onTap: () {
                        formkey.currentState!.validate();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.0),
                          color: Colors.black,
                        ),
                        child: Text(
                          'Add Product',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                ///////
              ],
            ),
          ),
        ],
      ),
      /////////////////
    );
  }
}
