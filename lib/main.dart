import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/network/local/cache_helper.dart';
import 'package:toursim/network/remote/dio_helper.dart';
import 'package:toursim/presntation/add_place.dart';
import 'package:toursim/presntation/forget_password.dart';
import 'package:toursim/core/utils/app_theme.dart';
import 'package:toursim/presntation/home.dart';
import 'package:toursim/presntation/splash_view.dart';

import 'core/language/translate.dart';
import 'presntation/gov_details.dart';
import 'presntation/auth_view.dart';
import 'presntation/place_details.dart';
//private code here
