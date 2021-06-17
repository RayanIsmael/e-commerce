import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class Myclass extends ChangeNotifier {
  var _email, _name;

  signUp({name, email, password}) async {
    _email = email;
    _name = name;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
