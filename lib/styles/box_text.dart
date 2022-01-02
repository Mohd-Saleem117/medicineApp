import 'package:flutter/material.dart';
import '/styles/text_info.dart';

class Textstyle extends StatelessWidget {
  final String text;
  final TextStyle style;

  const Textstyle.h1(this.text) : style = h1;
  const Textstyle.h2(this.text) : style = h2;
  const Textstyle.h3(this.text) : style = h3;
  const Textstyle.heading(this.text) : style = heading;
  const Textstyle.body(this.text) : style = body;
  const Textstyle.subheading(this.text) : style = subheading;
  const Textstyle.subheadingm(this.text) : style = subheadingm;
  const Textstyle.caption(this.text) : style = caption;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
