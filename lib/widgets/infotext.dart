import 'package:flutter/material.dart';
import 'package:students_table/core/core.dart';

class InfoText extends StatelessWidget {
   InfoText({ Key? key, required this.title,required this.size, required this.color}) : super(key: key);
  final String title;
 final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(title,style:TextStyle(color:color,fontSize:size,fontFamily:fontfam,fontWeight: FontWeight.bold),);
  }
}