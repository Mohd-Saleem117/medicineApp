// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';
import '../main.dart';
import '../models/arr.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class addReminders extends StatefulWidget {
  addReminders({Key? key}) : super(key: key);

  @override
  _addRemindersState createState() => _addRemindersState();
}

class _addRemindersState extends State<addReminders> {
  DateTime setDate = DateTime.now();
  // DateTime t, d;
  // DateTime d = new DateTime.now();
  TimeOfDay setTime = TimeOfDay.now();
  var name, des, bf;
  var a, tot;
  var ts;
  List list1 = ['After Food', 'Before Food'];
  List list2 = ['Tablet', 'Syrup'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.chevron_left,
                    size: 28,
                    color: Color(0xff1DA6AC),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 32, 0, 46),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Reminder',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop(
                              Arr(
                                  name: name,
                                  setTime: setTime.toString(),
                                  setDate: setDate.toString(),
                                  des: des,
                                  bf: bf,
                                  ts:ts,
                                  a: a,
                                  tot: tot),
                            );
                          },
                          child: Icon(
                            Icons.done,
                            size: 32,
                            color: Color(0xff1DA6AC),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: TextField(
                    style: TextStyle(
                        // color: Colors.red,
                        ),
                    onChanged: (value1) {
                      name = value1;
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
                      hintText: 'Medicine Name',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: TextField(
                    onChanged: (value1) {
                      des = value1;
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
                      hintText: 'Description',
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
                      hint: Text('Tablet or Syrup'),
                      dropdownColor: Colors.grey,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 22,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      value: ts,
                      onChanged: (newvalue) {
                        setState(() {
                          ts = newvalue;
                        });
                      },
                      items: list2.map((valueitem) {
                        return DropdownMenuItem(
                            value: valueitem, child: Text(valueitem));
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Text(d==null? 'Nothing has picked' : d.toString())
                      // Text(setDate.toString()),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: InkWell(
                          onTap: () async {
                            final initialTime = TimeOfDay(hour: 9, minute: 0);
                            final newTime = await showTimePicker(
                              context: context,
                              initialTime: setTime,
                            );
                            if (newTime == null) return;

                            setState(() => setTime = newTime);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 48,
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      // '${setTime.hour}:${setTime.minute}',
                                      '${setTime.hour.toString().padLeft(2, '0')}:${setTime.minute.toString().padLeft(2, '0')}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  Icon(
                                    Icons.timer_outlined,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: InkWell(
                          onTap: () async {
                            final initialDate = DateTime.now();
                            final newDate = await showDatePicker(
                              context: context,
                              initialDate: setDate,
                              firstDate: DateTime(DateTime.now().year),
                              lastDate: DateTime(DateTime.now().year + 5),
                            );

                            if (newDate == null) return;

                            setState(() => setDate = newDate);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 48,
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat('dd/MM').format(setDate),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  Icon(
                                    Icons.date_range,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                //   child: TextField(
                //     onChanged: (value1) {
                //       bf = value1;
                //     },
                //     keyboardType: TextInputType.text,
                //     autofocus: true,
                //     // textAlign: TextAlign.center,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //       hintText: 'Before or After Food',
                //       filled: true,
                //       fillColor: Colors.white,
                //     ),
                //   ),
                // ),
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
                      hint: Text('When to take'),
                      dropdownColor: Colors.grey,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 22,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      value: bf,
                      onChanged: (newvalue) {
                        setState(() {
                          bf = newvalue;
                        });
                        // print(ba);
                      },
                      items: list1.map((valueitem) {
                        return DropdownMenuItem(
                            value: valueitem, child: Text(valueitem));
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: TextField(
                    onChanged: (value1) {
                      tot = value1;
                    },
                    keyboardType: TextInputType.number,
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
                      hintText: 'Current Stock',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                //   child: TextField(
                //     onChanged: (value1) {
                //       a = value1;
                //     },
                //     // keyboardType: TextInputType.text,
                //     autofocus: true,
                //     // textAlign: TextAlign.center,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //       hintText: 'How many',
                //       filled: true,
                //       fillColor: Colors.white,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: TextField(
                    onChanged: (value1) {
                      a = value1;
                    },
                    keyboardType: TextInputType.number,
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
                      hintText: 'How many',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
