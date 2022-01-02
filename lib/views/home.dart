// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:med_rem/views/addReminders.dart';
import 'package:med_rem/views/settings.dart';
import 'package:med_rem/styles/text_info.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'addReminder.dart';
import '../models/arr.dart';
import 'settings.dart';
import 'stockDetails.dart';
import 'nav.dart';
import '../styles/text_info.dart';
import '../styles/color_styles.dart';
import '../styles/box_text.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  String user = "";
  var number;

  Home(user, number) {
    this.user = user;
    this.number = number;
  }

  @override
  State<Home> createState() => _HomeState(user, number);
}

class _HomeState extends State<Home> {
  String user = "";
  var number;

  _HomeState(user, number) {
    this.user = user;
    this.number = number;
  }
  DateTime setDate = new DateTime.now();
  TimeOfDay setTime = new TimeOfDay.now();

  final List<Arr> array = [
    Arr(
        name: 'Acetaminophen',
        setTime: '08:15',
        setDate: '30/12',
        tot: 10,
        ts: 'Tablet',
        des: 'For the treatment of headache',
        a: 1,
        bf: 'Before Food'),
    Arr(
        name: 'Dolo',
        setTime: '08:15',
        setDate: '30/12',
        tot: 10,
        des: 'For the treatment of headache',
        ts: 'Tablet',
        a: 1,
        bf: 'After Food'),
    Arr(
        name: 'Vicks Action',
        setTime: '08:15',
        setDate: '30/12',
        tot: 10,
        des: 'For the treatment of headache',
        ts: 'Tablet',
        a: 1,
        bf: 'After Food'),
  ];

  @override
  Widget cardTemplate(array) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          height: 300.0,
          width: 250.0,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.0, 20.0, 25.0, 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  array.name,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  array.setTime,
                  style: TextStyle(fontSize: 25.0, color: Colors.grey[600]),
                ),
                Text(
                  array.setDate,
                  style: TextStyle(fontSize: 25.0, color: Colors.grey[600]),
                ),
                SizedBox(height: 10.0),
                Text(
                  array.des,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 20.0),
                // if (array.ts == 'Tablet') Image.asset('images/tablet.jpg'),
                Image.asset('images/tablet.jpg'),
                Text(
                  '${array.a} ${array.bf}',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xff1DA6AC),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget stockDetail(array) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            array.name,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Text(
            'n/${array.tot}',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primary),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: background,
        title: Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            'Hello $user!',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: primary),
          ),
        ),
      ),
      endDrawer: Navbar(array),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Text(
              //       'Hello $user!',
              //       style: TextStyle(
              //         fontSize: 22.0,
              //         fontFamily: 'Arial',
              //       ),
              //     ),
              //     // IconButton(
              //     //   onPressed: () async {
              //     //     final newval =
              //     //         await Navigator.of(context).push(MaterialPageRoute(
              //     //       builder: (context) => Navbar(array),
              //     //     ));
              //     //   },
              //     //   icon: Icon(Icons.segment),
              //     // ),
              //   ],
              // ),
              // // Text(
              // //     'Reminder for\nYour medications',
              // //     style : TextStyle(
              // //       fontSize : 30.0,
              // //       fontWeight: FontWeight.bold,
              // //     ),
              // // ),
              // // SizedBox(height: 30.0),

              Text(
                '$number',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Arial',
                ),
              ),

              //Stock Details
              InkWell(
                onTap: () async {
                  final newval =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => stockDetails(array),
                  ));
                  setState(() {
                    array.remove(newval);
                  });
                },
                // onTap: () => Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => stockDetails(array),
                //   ),
                // ),
                child: SizedBox(
                  height: 188,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        width: 400.0,
                        color: Colors.white,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Stock Details',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1DA6AC),
                                      ),
                                    ),
                                    Text(
                                      '${array.length} medicines',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1DA6AC),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: array
                                      .map((data) => stockDetail(data))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35.0),

              //Card
              Container(
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(height: 5.0),

              //Cards
              Container(
                height: 316,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: array.map((data) => cardTemplate(data)).toList(),
                  ),
                ),
              ),

              SizedBox(height: 33),

              //bottom bar
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // color: Colors.white,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                        child: IconButton(
                          onPressed: () async {
                            final newval = await Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) => settings(
                                  // UserDetails(name: user, number: number)
                                  ),
                            ));
                            // if (newval) {
                            //   setState(() {
                            //     user = newval.name;
                            //     number = newval.number;
                            //   });
                            // }
                          },
                          icon: Icon(
                            Icons.settings_outlined,
                            color: Color(0xff1DA6AC),
                            size: 38.0,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 15.0),
                          backgroundColor: Color(0xff1DA6AC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        onPressed: () async {
                          final newval = await Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => addReminders(),
                          ));
                          // print(newval.name);

                          // setState(() => array.add(newval));

                          if (newval != null) {
                            setState(() {
                              array.add(newval);
                            });
                          }
                          // ;
                        },
                        icon: Icon(Icons.add, color: Colors.white),
                        label: Text(
                          'Add Reminder',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: IconButton(
                          onPressed: () {
                            launch("tel://21213123123");
                          },
                          icon: Icon(
                            Icons.call,
                            color: Colors.green[700],
                            size: 38.0,
                          ),
                        ),
                      ),
                    ],
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
