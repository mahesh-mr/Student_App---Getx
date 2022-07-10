import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:students_table/controller/studentcontroolr.dart';
import 'package:students_table/view/list_screen.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    gotoHome();
    super.initState();
  }

  // StudentController studentController = Get.put(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.network(
          "https://assets4.lottiefiles.com/packages/lf20_snxyauge.json"),
    ),
    );
  }

  Future<void> gotoHome() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Get.to(ListScreen());
  }
}
