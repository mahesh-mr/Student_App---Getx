import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students_table/controller/studentcontroolr.dart';
import 'package:students_table/core/core.dart';
import 'package:students_table/model/model.dart';
import 'package:students_table/widgets/infotext.dart';


class ViewScreen extends StatelessWidget {
  int index;
  ViewScreen({Key? key, required this.index}) : super(key: key);
  Box<StudentModel> Students = Hive.box<StudentModel>(boxName);

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.put(StudentController());
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: green1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

 

      body: ListView(children: [
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
          Positioned(
            top: 55.0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: green2,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(() {
                  StudentModel student =
                     
                      studentController.allStudents[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            alignment: Alignment.center,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 15, sigmaY: 15),
                                    child: Container(
                                      height: 450,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white60,
                                                Colors.white10
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white30,
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            student.image ==null?  CircleAvatar(
                                              backgroundColor: Colors.transparent,
                            radius:70,
                            backgroundImage:AssetImage("asset/logo2.png"),
                          ):
                                            CircleAvatar(
                                              radius: 70,
                                              backgroundImage: FileImage(File(
                                                  student.image.toString())),
                                            ),
                                             const SizedBox(height: 30,),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children:  [
                                                    InfoText(title: "Name", size: 20,color: green1, ),
                                                
                                                    
                                                    height10,
                                                     InfoText(title: "Age", size: 20,color: green1,),
                                                   
                                                    height10,
                                                     InfoText(title: "Domin", size: 20,color: green1,),
                                                  
                                                    height10,
                                                     InfoText(title: "Email", size: 20,color: green1,),
                                                  
                                                    height10,
                                                     InfoText(title: "Mobile", size: 20,color: green1,),
                                                   
                                                    height10,
                                                     InfoText(title: "Place", size: 20,color: green1,),
                                                   
                                                    height10,
                                                  ],
                                                ),
                                                width10,
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                     InfoText(title: ":", size: 20,color: green1,),
                                                  
                                                    height10,
                                                       InfoText(title: ":", size: 20,color: green1,),
                                                    height10,
                                                       InfoText(title: ":", size: 20,color: green1,),
                                                    height10,
                                                      InfoText(title: ":", size: 20,color: green1,),
                                                    height10,
                                                       InfoText(title: ":", size: 20,color: green1,),
                                                    height10,
                                                      InfoText(title: ":", size: 20,color: green1,),
                                                    height10,
                                                  ],
                                                ),
                                                width10,
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                        InfoText(title: student.names, size: 20,color: green1,),
                                                  
                                                    height10,
                                                     InfoText(title:student.age, size: 20,color: green1,),
                                                    height10,
                                                     InfoText(title: student.domin, size: 20,color: green1,),
                                                    height10,
                                                    InfoText(title:student.email, size: 20,color: green1,),
                                                    height10,
                                                     InfoText(title: student.number, size: 20,color: green1,),
                                                    height10,
                                                      InfoText(title:student.place, size: 20,color: green1,),
                                                  
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )))),
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
