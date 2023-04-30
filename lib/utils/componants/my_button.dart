import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myElevatedButton({
  required String title,
  required VoidCallback onPressed,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20))),
      ),
      child:  Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );