import 'package:flutter/material.dart';
import 'package:students_table/core/core.dart';
import 'package:students_table/model/model.dart';
import 'package:students_table/view/add_screen.dart';

class SEivatedbutton extends StatelessWidget {
SEivatedbutton({
    Key? key,
     this.student,
    this.index,
   required this.onpressed,
    required this.icons,
    required this.title,
  }) : super(key: key);

  final StudentModel? student;
  final IconData icons;
  final String title;
  final int? index;
  VoidCallback onpressed;
  
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton
            .styleFrom(
                primary:
                    green1),
        onPressed:onpressed, 
        icon: Icon(
            icons),
        label: Text(
           title));
  }
}