// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:med_rem/controller/onboarding_controller.dart';
import '/styles/box_text.dart';
import '/styles/color_styles.dart';
import 'package:get/state_manager.dart';
import 'package:med_rem/views/infoInput.dart';

class Onboarding extends StatelessWidget {
  final _controller = onBoarding_Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: background,
        title: Text('Medicine Reminder',
            style: TextStyle(
                color: primary, fontSize: 24, fontWeight: FontWeight.w700)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Inputinfo(),
                  ));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          // alignment: Alignment.topCenter,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.pageindex,
                itemCount: _controller.onboardingpages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _controller.onboardingpages[index].imageAssest,
                          height: 250,
                          width: 250,
                        ),
                        SizedBox(height: 24),
                        Text(
                          _controller.onboardingpages[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primary,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          _controller.onboardingpages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                }, //Item builder
              ),
            ),
            //Appname
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _controller.onboardingpages.length,
                      (index) => Obx(() {
                        return Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: _controller.pageindex.value == index
                                ? mono
                                : Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                  //Next_button
                  Padding(
                    padding: const EdgeInsets.only(top: 56.0),
                    child: InkWell(
                      onTap: _controller.forwardaction,
                      child: Ink(
                        child: Container(
                          width: 340,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primary,
                          ),
                          child: Center(
                            child: Text(
                              "Next",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Page_indicator
          ],
        ),
      ),
    );
  } //build
}
