import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(
    {required String message,
    bool? isError,
    bool? isSuccess,
    bool? isWarning,
    ToastGravity? gravity}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white.withOpacity(0.15),
      textColor: isSuccess ?? false
          ? Colors.green
          : isWarning ?? false
              ? Colors.yellow
              : Colors.red,
      fontSize: 16.0);
}
