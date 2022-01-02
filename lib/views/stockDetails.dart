// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/arr.dart';

class stockDetails extends StatefulWidget {
  List<Arr> arr = [];

  stockDetails(arr) {
    this.arr = arr;
  }

  @override
  _stockDetailsState createState() => _stockDetailsState(arr);
}

class _stockDetailsState extends State<stockDetails> {
  List<Arr> arr = [];
  _stockDetailsState(arr) {
    this.arr = arr;
  }
  var name, time, des, bf;
  var a, tot;
  var ts;

  @override
  Widget cardTem(array) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          elevation: 0,
          child: Container(
            // Color: Colors.white,
            height: 56,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                        child: Text(
                          '${array.a}/${array.tot}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${array.name}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(array);
                      setState(() {
                        arr.remove(array);
                      });
                    },
                    child: Icon(Icons.delete_forever, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.chevron_left,
                        size: 28, color: Color(0xff1DA6AC))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                  child: Text(
                    'Stocks',
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
                  children: arr.map((data) => cardTem(data)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
