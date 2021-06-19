import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/provider/provider1.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class Edite extends StatefulWidget {
  final mname, mdes, mprice, mcategory, url,docid;
  Edite({Key? key, this.mname, this.mdes, this.mprice, this.mcategory, this.url, this.docid}) : super(key: key);

  @override
  _EditeState createState() => _EditeState();
}

class _EditeState extends State<Edite> {
  var imageUlr;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
/////*************************************/////
  @override
  Widget build(BuildContext context) {
    var name, price, des, category;
    var media = MediaQuery.of(context).size.height;
    var modalprovider = Provider.of<ModalProgress>(context);
    /////////////////add product//////////
    /////////////////////////
    addproduct(context) async {
      var alldata = formkey.currentState;
      if (alldata!.validate()) {
        modalprovider.change(true);
        alldata.save();
        await FirebaseFirestore.instance
            .collection("products").doc(widget.docid)
            .update({
              "name": name,
              "description": des,
              "price": price,
              "category": category,
              "image_url": (imageUlr == null)?widget.url:imageUlr,
            })
            .then((value) => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Edited Product"))))
            .catchError(
                // ignore: invalid_return_type_for_catch_error
                (error) => ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Error"))));
        /////////
        modalprovider.change(false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Wrong Input")));
      }
    }
    ////////
    /////////////////End //////////

    return Scaffold(
      backgroundColor: Colors.amber,
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: Text('Edite Page'),
        titleSpacing: 2,
        centerTitle: true,
      ),
      //////////////////
      body: ModalProgressHUD(
        inAsyncCall: modalprovider.modalhub,
        child: ListView(
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
                      initialValue:"${widget.mname}",
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
                  ///////height
                  SizedBox(
                    height: media * 0.01,
                  ),
                  ////////price
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      initialValue: "${widget.mprice}",
                      ///////Validator//////
                      onSaved: (newValue) {
                        price = newValue;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return "Price Is Empty";
                        if (value.length < 2) return "Wrong Value";
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
                  ///////height
                  SizedBox(
                    height: media * 0.01,
                  ),
                  ////////Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      initialValue: "${widget.mdes}",
                      ///////Validator//////
                      onSaved: (newValue) {
                        des = newValue;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return "Description Is Empty";
                        if (value.length < 10) return "Wrong Value";
                        if (value.length > 200) return "Wrong Value";
                        return null;
                      },
                      /////////////
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      /////
                      cursorColor: Colors.amber,
                      maxLines: 3,
                      decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(
                            Icons.text_format_rounded,
                            color: Colors.amber,
                          ),
                          fillColor: Colors.amber[100],
                          hintText: "Product Description",
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
                  ///////height
                  SizedBox(
                    height: media * 0.01,
                  ),
                  ////////Category
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      initialValue: "${widget.mcategory}",
                      ///////Validator//////
                      onSaved: (newValue) {
                        category = newValue;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return "Category Is Empty";
                        if (value.length < 3) return "Wrong Value";
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
                  ///////////////////////////////////////////////////////Image
                  SizedBox(
                    height: media * 0.02,
                  ),
                  /////////////pick image
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: InkWell(
                        onTap: () {
                          show(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21.0),
                            color: Colors.black,
                          ),
                          child: Text(
                            'Edit Image \*',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                  ///////
                  SizedBox(
                    height: media * 0.04,
                  ),
                  /////login Button/////
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: InkWell(
                        onTap: () {
                          addproduct(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21.0),
                            color: Colors.black,
                          ),
                          child: Text(
                            'Edit Product',
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
      ),
      /////////////////
    );
  }

  ///////////////////////
  // ignore: non_constant_identifier_names
  show(context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.amber[200],
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.elliptical(150, 30))),
        builder: (context) {
          return Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                IconButton(
                  onPressed: () async {
                    var providerpro =
                        Provider.of<ModalProgress>(context, listen: false);
                    File file;
                    var imagePicker = ImagePicker();

                    var image =
                        await imagePicker.getImage(source: ImageSource.gallery);
                    if (image != null) {
                      providerpro.change(true);
                      file = File(image.path);
                      var imagename = basename(image.path);
                      var randam = Random().nextInt(10000);
                      String iname = "$randam" + "---" + "$imagename";
                      var ref =
                          FirebaseStorage.instance.ref("images").child(iname);
                      await ref.putFile(file).whenComplete(() async {
                        await ref.getDownloadURL().then((value) {
                          setState(() {
                            imageUlr = value;
                          });
                        });
                      });
                      providerpro.change(false);
                    } else {
                      print("no");
                    }
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.photo_camera_back,
                    color: Colors.amber[900],
                  ),
                  iconSize: 40,
                ),
                SizedBox(
                  width: 80,
                ),
                IconButton(
                  onPressed: () async {
                    var providerpro =
                        Provider.of<ModalProgress>(context, listen: false);
                    //////////////
                    File file;
                    var imagePicker = ImagePicker();

                    var image =
                        await imagePicker.getImage(source: ImageSource.camera);
                    if (image != null) {
                      providerpro.change(true);
                      file = File(image.path);
                      var imagename = basename(image.path);
                      var randam = Random().nextInt(10000);
                      String iname = "$randam" + "---" + "$imagename";
                      var ref =
                          FirebaseStorage.instance.ref("images").child(iname);
                      await ref.putFile(file).whenComplete(() async {
                        await ref.getDownloadURL().then((value) {
                          setState(() {
                            imageUlr = value;
                          });
                        });
                      });
                      providerpro.change(false);
                    } else {
                      print("no");
                    }
                    Navigator.of(context).pop();
                    /////////////
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.amber[900],
                  ),
                  iconSize: 40,
                ),
              ],
            ),
          );
        });
  }
}
