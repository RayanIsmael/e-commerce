import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screen/edite.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class EditeProducts extends StatefulWidget {
  EditeProducts({Key? key}) : super(key: key);

  @override
  _EditeProductsState createState() => _EditeProductsState();
}

class _EditeProductsState extends State<EditeProducts> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

/////*************************************/////
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.amber,
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: Text('Edite Products'),
        titleSpacing: 2,
        centerTitle: true,
      ),
      ///////////////
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      shadowColor: Colors.amber[900],
                      color: Colors.amber[100],
                      child: Row(
                        children: [
                          /////////////////////
                          Expanded(
                              flex: 1,
                              child: Image.network(
                                snapshot.data!.docs[index].data()["image_url"],
                                height: 80,
                                width: 40,
                                fit: BoxFit.fill,
                              )),
                          ////////////////////
                          Expanded(
                            flex: 4,
                            child: ListTile(
                              onTap: () {},
                              title: Text(
                                "${snapshot.data!.docs[index].data()['name']}  :   ${snapshot.data!.docs[index].data()['price']}\$ ",
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Container(
                                height: 30,
                                child: Text(
                                  snapshot.data!.docs[index]
                                      .data()["description"],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              trailing: Wrap(spacing: 0, children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Edite(
                                        mname: snapshot.data!.docs[index]
                                            .data()['name'],
                                        mprice: snapshot.data!.docs[index]
                                            .data()['price'],
                                        mdes: snapshot.data!.docs[index]
                                            .data()["description"],
                                        mcategory: snapshot.data!.docs[index]
                                            .data()['category'],
                                        url: snapshot.data!.docs[index]
                                            .data()["image_url"],
                                        docid: snapshot.data!.docs[index].id,
                                      ),
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.drive_file_rename_outline_outlined,
                                  ),
                                  color: Colors.amber[600],
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection("products")
                                          .doc(snapshot.data!.docs[index].id)
                                          .delete()
                                          .whenComplete(() async{
                                        await FirebaseStorage.instance
                                            .refFromURL(snapshot
                                                .data!.docs[index]
                                                .data()["image_url"])
                                            .delete()
                                            .whenComplete(() {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text("Deleted")));
                                        }).catchError((e){
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text("Error")));
                                        }
                                          
                                        );
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete_rounded,
                                      color: Colors.red[300],
                                    ))
                              ]),
                            ),
                          ),
                          ////////////////
                        ],
                      ),
                    ),
                    ///////////////////
                    SizedBox(
                      height: media * 0.01,
                    )
                  ],
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Text("Error");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),

      ////////////////
    );
  }
}
