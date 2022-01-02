// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:med_rem/views/addReminders.dart';
import 'package:med_rem/views/settings.dart';
// import 'addReminder.dart';
import '../models/arr.dart';
import 'settings.dart';
import 'stockDetails.dart';

class personalinfo extends StatefulWidget {
  // List<UserDetails> newval = [];
  // String user = "";
  // String gender="";
  // var number;
  // personalinfo(newval) {
  //   user = newval.name;
  //   this.number = newval.number;
  //   this.gender = newval.gender;
  // }

  @override
  _personalinfoState createState() => _personalinfoState();
}

class _personalinfoState extends State<personalinfo> {
  // List<UserDetails> newval = [];

  String user = "";
  var gender;
  var number;

  // _personalinfoState(newval) {
  //   user = newval.name;
  //   this.number = newval.number;
  //   this.gender = newval.gender;
  // }

  List items = ['Male', 'Female', 'Transgender'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 32),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.chevron_left_outlined,
                    color: Color(0xff1DA6AC),
                    size: 32,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 56),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Personal Info',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(
                          // UserDetails(
                          //   name: user, number: number, gender: gender)
                          ),
                      child: Icon(
                        Icons.done,
                        size: 28,
                        color: Color(0xff1DA6AC),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: TextField(
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  onChanged: (value) {
                    user = value;
                  },
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  // textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: 'Name',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: TextField(
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  onChanged: (value) {
                    number = value;
                  },
                  keyboardType: TextInputType.phone,
                  autofocus: true,
                  // textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: 'Emergency Number',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Container(
                  height: 60,
                  padding: EdgeInsets.fromLTRB(13, 22, 13, 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: DropdownButton(
                    hint: Text('Select Gender'),
                    dropdownColor: Colors.grey,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 22,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    value: gender,
                    onChanged: (newvalue) {
                      setState(() {
                        gender = newvalue;
                      });
                    },
                    items: items.map((valueitem) {
                      return DropdownMenuItem(
                          value: valueitem, child: Text(valueitem));
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
