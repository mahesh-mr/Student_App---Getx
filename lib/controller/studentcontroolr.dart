import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students_table/model/model.dart';



class StudentController extends GetxController {
  final box = Hive.box<StudentModel>(boxName);
  String? imagePath;
  
  RxList<StudentModel> allStudents = <StudentModel>[].obs;
  getStudents() {
    allStudents.value = box.values.toList();
   
  }

  getSearch(){
  
  }
updateStudent(int index, StudentModel newStudent){
  box.putAt(index, newStudent );
  getStudents();
}

addStudent(StudentModel newStudent){
  box.add(newStudent);
  getStudents();
}

  deletestudents(int index) {
    box.deleteAt(index);
    getStudents();
  }

  @override
  void onInit() {
    getStudents();
    super.onInit();
  }

final ImagePicker imagePicker =ImagePicker();
Future picImage(ImageSource imageSource)async{
  XFile? image =await imagePicker.pickImage(source: imageSource);

  if(image == null) return;
   
  final imageTemporary = File(image.path);
  imagePath = imageTemporary.path;
  Get.back();
  update();
 
}
 
  
}
