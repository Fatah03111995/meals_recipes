import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilComponent {
  static toastErr(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red[300],
      timeInSecForIosWeb: 3,
      webShowClose: true,
    );
  }

  static toastSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green[300],
      timeInSecForIosWeb: 3,
      webShowClose: true,
    );
  }

  static toastInfo(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.grey,
      timeInSecForIosWeb: 3,
      webShowClose: true,
    );
  }

  static toastWarning(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.yellow[300],
      timeInSecForIosWeb: 3,
      webShowClose: true,
    );
  }
}
