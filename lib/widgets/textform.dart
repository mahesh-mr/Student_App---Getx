


import 'package:flutter/material.dart';

import 'package:students_table/core/core.dart';

class TextForm extends StatelessWidget {
 final TextEditingController controller;
 final FormFieldValidator validator;
 final IconData icons;
 final String title;
 
 @immutable
const  TextForm({ Key? key, required this.validator,required this.controller,required this.icons, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
         focusedBorder:const
          OutlineInputBorder(
            borderSide: BorderSide(color: green1),
          ),
  
           prefixIcon:Icon(icons ,color: green1,),
                     label: Text(title),
          focusColor: green1,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          

          )),

      );
      


    
  }
}