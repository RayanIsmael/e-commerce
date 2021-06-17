import 'package:flutter/widgets.dart';

class ModalProgress extends ChangeNotifier {
  bool modalhub = false;

  change(bool a) {
    modalhub = a;
    notifyListeners();
  }
}
