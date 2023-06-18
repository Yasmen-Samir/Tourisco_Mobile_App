import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toursim/core/utils/assets_manager.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


Widget myScaffoldBackground({
  Widget? body,
  PreferredSizeWidget? appBar,
}
    )=>Container(
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
    appBar: appBar,
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

Widget condition({
  required bool condition,
  required Widget child,
})=> ConditionalBuilder(
  condition: condition,
  builder: (context) => child,
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);
