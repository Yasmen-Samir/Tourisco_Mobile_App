import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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