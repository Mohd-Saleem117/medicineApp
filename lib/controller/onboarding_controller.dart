// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:med_rem/views/infoInput.dart';
import '/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class onBoarding_Controller {
  var isTrue = 0;
  var pageindex = 0.obs;
  var pageController = PageController();
  bool get islast => pageindex.value == onboardingpages.length - 1;

  forwardaction() {
    if (islast) {
      Get.to(() => Inputinfo());
      isTrue = 1;
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onboardingpages = [
    //track_medicine
    OnBoardingInfo('images/care.png', 'Track your medicines',
        'Know what medicines you use daily and when to take'),
    //reminder_text
    OnBoardingInfo(
        'images/reminder 1.png',
        'Never miss any\n medicines on time',
        'Get reminder of what medicine to take on time'),
    //Stock_text
    OnBoardingInfo('images/empty_cart.png', 'Stock up your supplies',
        'Get reminder of when medicines are about to over'),
  ];
}
