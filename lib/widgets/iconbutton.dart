import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
IconButtons({ Key? key, required this.icons,required this.onpressed, required this.colors}) : super(key: key);

  final IconData icons;
  final Color colors;
  VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onpressed
    , icon:Icon(icons,color: colors,) );
  }
}