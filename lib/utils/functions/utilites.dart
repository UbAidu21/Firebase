

import 'package:fluttertoast/fluttertoast.dart';

class Utilities {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 15,
    );
  }
}
