import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/assets_manager.dart';

Widget myScaffoldBackground({Widget? body})=>Container(
  height: double.infinity,
  width: double.infinity,
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        ImagesManager.back3,
      ),
      fit: BoxFit.fill,
    ),
  ),
  child: Scaffold(
    backgroundColor: Colors.transparent,
    body: body,
  ),
);

void showToast({
  required String message,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastState { success, error, warning }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.warning:
      color = Colors.deepOrange;
      break;
  }

  return color;
}
