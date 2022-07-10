import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:students_table/controller/studentcontroolr.dart';
import 'package:students_table/core/core.dart';
import 'package:students_table/model/model.dart';
import 'package:students_table/view/view.dart';

class Searches extends SearchDelegate {
  final studentSearch = Hive.box<StudentModel>(boxName);

  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor:white1,
        elevation: 0,
      ),
      // ignore: prefer_const_constructors
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,

        // Use this change the placeholder's text style
        hintStyle: const TextStyle(fontSize: 24.0),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        color: green1,
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: green1,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query,style: TextStyle(color: green1),));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<StudentModel> suggestions = studentSearch.values.toList();

    final stdList = query.isEmpty
        ? suggestions
        : suggestions.where((element) {
            return element.names.toLowerCase().contains(query.toLowerCase());
          }).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor:white1,
        body: stdList.isEmpty
            ? const Center(
                child: Text("no student found"),
              )
            : ListView.builder(
                itemCount: stdList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewScreen(
                            index: suggestions.indexWhere((element) =>
                                element.names == stdList[index].names),
                          ),
                        ),
                      );
                    },
                    title: Text(stdList[index].names),
                    subtitle: Text(stdList[index].domin),
                    leading: stdList[index].image == null
                        ? const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40,
                            backgroundImage: AssetImage("asset/logo2.png"),
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(
                                File(suggestions[index].image.toString()))),
                  );
                },
              ),
      ),
    );
  }
}
