import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:med_rem/models/arr.dart';
import 'package:med_rem/views/stockDetails.dart';
import 'settings.dart';
import 'tablets.dart';

class Navbar extends StatefulWidget {
  List<Arr> array = [];
  Navbar(array) {
    this.array = array;
  }
  @override
  _NavbarState createState() => _NavbarState(array);
}

class _NavbarState extends State<Navbar> {
  List<Arr> array = [];
  _NavbarState(array) {
    this.array = array;
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Material(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 12),
                const SizedBox(height: 24),
                buildMenuItem(
                  text: 'Stock',
                  icon: Icons.inventory_2_rounded,
                  onClicked: () => selectedItem(context, 0),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Tablets',
                  icon: Icons.medication_rounded,
                  onClicked: () => selectedItem(context, 1),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Settings',
                  icon: Icons.settings_rounded,
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Made by',
                  icon: Icons.groups_rounded,
                  onClicked: () => selectedItem(context, 3),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Divider(color: Color(0xff1DA6AC)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Color(0xff1DA6AC);
    const hoverColor = Color(0xff1DA6AC);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => stockDetails(array),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Tablets(array),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => settings(),
          ),
        );
        break;
    }
  }
}
