// ignore_for_file: prefer_const_constructors, empty_statements
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:students_table/controller/studentcontroolr.dart';
import 'package:students_table/core/core.dart';
import 'package:students_table/model/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students_table/widgets/iconbutton.dart';
import 'package:students_table/widgets/showdialof.dart';
import 'package:students_table/widgets/textform.dart';

class AddScreen extends StatelessWidget {
  AddScreen({
    Key? key,
    this.student,
    this.isEditing = false,
    this.index,
  }) : super(key: key);

  bool isEditing;
  int? index;
  StudentModel? student;

  String? imagePath;

  XFile? xFile;

  
  final formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _domainController = TextEditingController();

  final _emailController = TextEditingController();

  final _placeController = TextEditingController();

  final _mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.put(StudentController());

    return Scaffold(
      // key: _scaffoldkey,
      backgroundColor: green1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 55.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: white1,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Form(
                          key: formkey,
                          child: GetBuilder<StudentController>(
                              init: StudentController(),
                              dispose: (_) {
                                imagePath = null;
                                _ageController.dispose();
                                _nameController.dispose();
                                _placeController.dispose();
                                _emailController.dispose();
                                _mobileController.dispose();
                                _domainController.dispose();
                                studentController.imagePath= null ;
                              },
                              initState: (state) {
                                if (isEditing) {
                                  _ageController.text = student!.age;
                                  _nameController.text = student!.names;
                                  _domainController.text = student!.domin;
                                  _emailController.text = student!.email;
                                  _placeController.text = student!.place;
                                  _mobileController.text = student!.number;
                                  studentController.imagePath= student!.image;
                                }
                              },
                              builder: (controller) {
                                return Column(
                                  children: [
                                    manefield(),
                                    height10,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 175,
                                          child: ageFeild(),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          width: 175,
                                          child: dominFeild()),
                                      ],
                                    ),
                                    height10,
                                    emailFeild(),
                                    height10,
                                    numberFelid(),
                                    height10,
                                    placeFelid(),

                                    // place(),
                                    height10,
                                    Row(
                                      children: [
                                        ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                                primary: green1),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                      'Select Choice',
                                                      style: TextStyle(
                                                          color: green1),
                                                    ),
                                                    actions: [
                                                      IconButtons(
                                                          icons: CupertinoIcons
                                                              .camera_fill,
                                                          onpressed: () async {
                                                            controller.picImage(
                                                                ImageSource
                                                                    .camera);
                                                          },
                                                          colors: green1),
                                                      Spacer(),
                                                      IconButtons(
                                                          icons: Icons.photo,
                                                          onpressed: () async {
                                                            controller.picImage(
                                                                ImageSource
                                                                    .gallery);
                                                          },
                                                          colors: green1),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              CupertinoIcons.camera,
                                              color: white1,
                                            ),
                                            label: Text(
                                              "Photo",
                                              style: TextStyle(color: white1),
                                            )),
                                        Spacer(),
                                        ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                              primary: green1),
                                          onPressed: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              Navigator.pop(context);
                                              StudentModel newStudent =
                                                  StudentModel(
                                                      age: _ageController.text,
                                                      names:
                                                          _nameController.text,
                                                      place:
                                                          _placeController.text,
                                                      domin: _domainController
                                                          .text,
                                                      email:
                                                          _emailController.text,
                                                      number: _mobileController
                                                          .text,
                                                      image: studentController
                                                          .imagePath);
                                              if (isEditing) {
                                              studentController.updateStudent(
                                                    index!, newStudent);
                                              } else {
                                                studentController.addStudent(newStudent);
                                                // Student.add(newStudent);
                                              }
                                              studentController.getStudents();
                                            }
                                          },
                                          icon: Icon(
                                            CupertinoIcons.square_arrow_right,
                                            color: white1,
                                          ),
                                          label: isEditing
                                              ? Text(
                                                  "Update",
                                                  style:
                                                      TextStyle(color: white1),
                                                )
                                              : Text(
                                                  "Submit",
                                                  style:
                                                      TextStyle(color: white1),
                                                ),
                                        )
                                      ],
                                    )
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GetBuilder<StudentController>(builder: (controller) {
                return Positioned(
                    top: 5,
                    left: (MediaQuery.of(context).size.width / 2 - 70),
                    child: controller.imagePath != null
                        ? CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 70,
                            backgroundImage: FileImage(
                              File(
                                controller.imagePath.toString(),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 70,
                            backgroundImage: AssetImage("asset/logo2.png"),
                          ));
              }),
            ],
          )
        ],
      ),
    );
  }

  TextForm placeFelid() {
    return TextForm(
        validator: (value) {
          if (value!.length == 0) {
            return "Enter your place";
          } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
            return 'Please enter a valid place';
          } else {
            return null;
          }
        },
        controller: _placeController,
        icons: Icons.home,
        title: "Place");
  }

  TextForm numberFelid() {
    return TextForm(
      controller: _mobileController,
      icons: Icons.phone,
      title: "Number",
      validator: (value) {
        if (value == null) {
          return "Required Field";
        } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
          return 'Please enter valid mobile number';
        } else {
          return null;
        }
      },
    );
  }

  TextForm emailFeild() {
    return TextForm(
        validator: (value) {
          if (value == null) {
            return "Required Field";
          } else if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return "Enter a valid email";
          } else {
            return null;
          }
        },
        controller: _emailController,
        icons: CupertinoIcons.envelope,
        title: "Email");
  }

  TextForm dominFeild() {
    return TextForm(
        validator: (value) {
          if (value == "") {
            return "Field is required";
          }
          return null;
        },
        controller: _domainController,
        icons: CupertinoIcons.briefcase,
        title: "Domin");
  }

  TextForm ageFeild() {
    return TextForm(
        validator: (value) {
          if (value!.isEmpty || value == null) {
            return "Required Field";
          } else if (int.parse(value) < 17 || int.parse(value) > 60) {
            return "Must be b/w 18-60";
          } else {
            return null;
          }
        },
        controller: _ageController,
        icons: Icons.person,
        title: "Age");
  }

  TextForm manefield() {
    return TextForm(
        validator: (value) {
          if (value!.length == 0) {
            return "Enter your name";
          } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
            return 'Please enter a valid name';
          } else {
            return null;
          }
        },
        controller: _nameController,
        icons: Icons.person,
        title: "Name");
  }
}
