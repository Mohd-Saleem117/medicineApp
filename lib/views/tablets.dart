// ignore_for_file: prefer_const_constructors, prefer_initializing_formals, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:med_rem/styles/color_styles.dart';
import '/models/arr.dart';

class Tablets extends StatefulWidget {
  // const Tablets({Key? key}) : super(key: key);
  List<Arr> arr = [];

  Tablets(arr) {
    this.arr = arr;
  }

  @override
  _TabletsState createState() => _TabletsState(arr);
}

class _TabletsState extends State<Tablets> {
  List<Arr> arr = [];
  _TabletsState(arr) {
    this.arr = arr;
  }

  @override
  Widget tab(arr) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          elevation: 0,
          child: Container(
              height: 50,
              width: double.maxFinite,
              child: Center(
                child: Text('${arr.name}',
                    style: TextStyle(
                      fontSize: 20,
                      color: mono,
                    )),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: background,
        elevation: 0,
        title: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child:
                Icon(Icons.chevron_left, size: 28, color: Color(0xff1DA6AC))),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // InkWell(
              //     onTap: () {
              //       Navigator.of(context).pop();
              //     },
              //     child: Icon(Icons.chevron_left,
              //         size: 28, color: Color(0xff1DA6AC))),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                child: Text(
                  'Tablets',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: Text(
                  'You have ${arr.length} Tablets',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              Column(
                children: arr.map((data) => tab(data)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
