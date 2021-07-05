import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fmdelivery/app/modules/selectionpage/selectionui.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
// Here you can write your code

      Get.off(Selection());
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        backwardsCompatibility: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: GestureDetector(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/delivery-man-riding-red-scooter-illustration_9845-14.jpg',
              height: 350,
              width: 350,
            ),
            // Text(controller.count.toString()),
            Text(
              'FM Delivery',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                  color: Colors.red, fontSize: 40,
                  //letterSpacing: .5
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('                         আপনার বিশ্বস্ত সহযোগী',
                style: GoogleFonts.roboto(color: Colors.red, fontSize: 20))
          ],
        )),
      ),
    );
  }
}
