import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:students_table/view/list_screen.dart';
import 'package:students_table/model/model.dart';


 Future<void> main()async {

WidgetsFlutterBinding.ensureInitialized();
Directory directory = await getApplicationDocumentsDirectory();
Hive.init(directory.path);

Hive.registerAdapter(StudentModelAdapter());
await Hive.openBox<StudentModel>(boxName);

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
        
      ),
      home:ListScreen(),
    );
  }
}
