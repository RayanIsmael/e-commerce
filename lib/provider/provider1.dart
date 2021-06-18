import 'package:flutter/material.dart';
class ModalProgress extends ChangeNotifier {
  bool modalhub = false;

  change(bool a) {
    modalhub = a;
    notifyListeners();
  }
}
