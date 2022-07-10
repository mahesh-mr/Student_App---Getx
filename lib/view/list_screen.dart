// ignore_for_file: unnecessary_const

import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:students_table/controller/studentcontroolr.dart';
import 'package:students_table/core/core.dart';
import 'package:students_table/model/model.dart';
import 'package:students_table/view/add_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students_table/view/search.dart';
import 'package:students_table/view/view.dart';
import 'package:students_table/widgets/iconbutton.dart';
import 'package:students_table/widgets/infotext.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key, this.index}) : super(key: key);
  int? index;

  // Box<StudentModel> students = Hive.box<StudentModel>(boxName);

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.put(
      StudentController(),
    );
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: green1,
      body: ListView(
        children: [
          Row(
            children: [
              IconButtons(
                  icons: Icons.person_add_alt_rounded,
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => AddScreen(),
                      ),
                    );
                  },
                  colors: white1),
              const Spacer(),
              IconButtons(
                  icons: CupertinoIcons.search,
                  onpressed: () {
                    showSearch(
                      context: context,
                      delegate: Searches(),
                    );
                  },
                  colors: white1)
            ],
          ),
          height10,
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: InfoText(
                title: "Students",
                size: 40,
                color: white1,
              )),
          height20,
          Container(
            height: size.height - 150,
            decoration: const BoxDecoration(
              color: green2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(47),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                height: size.height - 180,
                color: Colors.transparent,
                child: Obx(
                  () {
                    return ListView.builder(
                      itemCount: studentController.allStudents.length,
                      itemBuilder: (BuildContext context, int index) {
                        StudentModel student =
                            studentController.allStudents[index];

                        return GestureDetector(
                          onTap: () {
                            Get.to(ViewScreen(index: index));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                  child: Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.white60,
                                            Colors.white10
                                          ]),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.white30,
                                      ),
                                    ),
                                    child: ListTile(
                                      leading: student.image == null
                                          ? const CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 40,
                                              backgroundImage:
                                                  AssetImage("asset/logo2.png"),
                                            )
                                          : CircleAvatar(
                                              radius: 40,
                                              backgroundImage: FileImage(
                                                File(
                                                  student.image.toString(),
                                                ),
                                              ),
                                            ),
                                      title: InfoText(
                                        title: student.names,
                                        size: 20,
                                        color: green1,
                                      ),
                                      subtitle: InfoText(
                                        title: student.domin,
                                        size: 18,
                                        color: green1,
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          bottamSheet(context, index, student,
                                              studentController);
                                        },
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: green1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> bottamSheet(BuildContext context, int index,
      StudentModel student, StudentController studentController) {
    return showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) => Container(
        color: white1,
        height: 200,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddScreen(
                              index: index,
                              isEditing: true,
                              student: student,
                            )));
              },
              title: const Text(
                "Edit",
                style: const TextStyle(
                  color: green1,
                ),
              ),
              leading: const Icon(
                Icons.edit,
                color: green1,
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Do You want Delet?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  studentController.deletestudents(index);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ))
                          ],
                        ));
              },
              leading: const Icon(
                CupertinoIcons.delete,
                color: green1,
              ),
              title: const Text(
                "Delete",
                style: TextStyle(
                  color: green1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
