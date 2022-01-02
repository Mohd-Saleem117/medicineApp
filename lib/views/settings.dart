// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:med_rem/models/arr.dart';
import 'package:med_rem/views/personalinfo.dart';
import '../main.dart';
import 'package:custom_switch/custom_switch.dart';

class settings extends StatefulWidget {
  // List<UserDetails> newval = [];

  // String user;
  // var number;

  // settings(newval) {
  //   user = newval.name;
  // this.number = newval.number;
  // }

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  // List<bool> _selections = List.generate(2, (_) => false);
  // List<UserDetails> newval = [];

  String user = "";
  String gender = "";
  var number;

  // _settingsState(newval) {
  //   user = newval.name;
  //   this.number = newval.number;
  //   this.gender = newval.gender;
  // }

  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 32),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.chevron_left,
                    size: 28,
                    color: Color(0xff1DA6AC),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                      height: 70,
                      width: double.maxFinite,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'Mohd Saleem',
                                  // user,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Personal Info',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                              onPressed: () async {
                                final newval = await Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => personalinfo(
                                      // UserDetails(
                                      //     name: user,
                                      //     number: number,
                                      // gender: gender)
                                      ),
                                ));
                                // if (newval) {
                                //   setState(() {
                                //     user = newval.name;
                                //     number = newval.number;
                                //     gender = newval.gender;
                                //   });
                                // }
                              },
                              icon: Icon(
                                Icons.arrow_forward_outlined,
                                size: 28,
                                color: Color(0xff1DA6AC),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Text(
                  'Preferences',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  height: 70,
                  width: double.maxFinite,
                  // color: Colors.grey[300],
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Notification',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Turn ON to get notifications',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 25,
                          width: 65,
                          child: CustomSwitch(
                            value: isSwitched,
                            activeColor: Color(0xff1DA6AC),
                            onChanged: (value) {
                              // print('Value : $isSwitched');
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
