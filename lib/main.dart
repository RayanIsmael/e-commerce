import 'package:e_commerce/provider/firestor_products.dart';
import 'package:e_commerce/provider/provider1.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ModalProgress()),
      ChangeNotifierProvider(create: (context) => Products()),
    ],
    child: MyApp(),
  ));
}
/////////////////////// check login

///////////////////////
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
