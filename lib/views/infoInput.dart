// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'home.dart';
import '/styles/color_styles.dart';
import 'package:get/get.dart';
import '../models/userInfo.dart';

class Inputinfo extends StatelessWidget {
  String user = "";
  var number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input form',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: GestureDetector(
          onTap: () {
            Get.toNamed("/Onboarding");
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: const Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    // hintText: 'Enter name',
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  onChanged: (value) {
                    user = value;
                  },
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                // maxLength: 13,
                decoration: const InputDecoration(
                  // hintText: 'Enter Emergency number',
                  border: OutlineInputBorder(),
                  labelText: 'Mobile number',
                ),
                onChanged: (value) {
                  number = value;
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 16,
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Emergency contact number to call\nWhen emergency Button is pressed',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Home(user, number),
            ),
          );
        },
        label: const Text(
          'Done',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: const Icon(
          Icons.done,
          color: Colors.white,
          size: 24,
        ),
        backgroundColor: primary,
        splashColor: mono,
        tooltip: 'Press after filling the details',
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
