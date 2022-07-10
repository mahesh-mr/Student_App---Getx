import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  String names;
  @HiveField(1)
  String age;
  @HiveField(2)
  String place;
  @HiveField(3)
  String number;
  @HiveField(4)
  String domin;
  @HiveField(5)
  String email;
  @HiveField(6)
  String? image;


  StudentModel(
      {
      required this.age,
      required this.place,required this.names,
      required this.domin,
      required this.email,
      required this.number,
       this.image});
}


const String boxName = "student";
