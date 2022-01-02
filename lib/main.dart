// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:med_rem/views/addReminders.dart';
import 'package:med_rem/views/settings.dart';
// import 'addReminder.dart';
import 'models/arr.dart';
import 'views/personalinfo.dart';
import 'views/settings.dart';
import 'views/stockDetails.dart';
import 'views/home.dart';
import 'styles/color_styles.dart';
import 'views/Onboarding.dart';
import 'views/infoInput.dart';


void main() => runApp(medicineApp());

class medicineApp extends StatelessWidget {
  String user = "";
  var number;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicine Reminder',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: Onboarding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => medicineApp(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: "/Homescreen",
          page: () => Home(user, number),
          transition: Transition.fade,
        ),
        GetPage(
          name: "/Inputinfo",
          page: () => Inputinfo(),
          transition: Transition.fade,
        ),
        GetPage(
          name: '/Onboarding',
          page: () => Onboarding(),
          transition: Transition.fade,
        ),
        GetPage(
          name: '/personalinfo',
          page: () => personalinfo(),
          transition: Transition.fade,
        ),
        GetPage(
          name: '/SettingsPage',
          page: () => settings(),
          transition: Transition.fade,
        ),
      ],
    );
  }
}
