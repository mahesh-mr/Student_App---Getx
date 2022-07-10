import 'package:flutter/material.dart';
import 'package:students_table/core/core.dart';
import 'package:students_table/widgets/iconbutton.dart';

class AlertBox extends StatelessWidget {
  AlertBox(
      {Key? key,
      required this.titile,
      required this.colors,
      required this.icons,
      required this.onpresed})
      : super(key: key);
  final String titile;
  final IconData icons;
  VoidCallback onpresed;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        titile,
        style: TextStyle(color: green1),
      ),
      actions: [IconButtons(icons: icons, onpressed: onpresed, colors: colors),
      IconButtons(icons: icons, onpressed: onpresed, colors: colors)],
    );
  }
}
