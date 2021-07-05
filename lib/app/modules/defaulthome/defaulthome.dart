import 'package:flutter/material.dart';
import 'package:fmdelivery/app/modules/package/prinfo.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DHome extends StatefulWidget {
  @override
  _DHomeState createState() => _DHomeState();
}

class _DHomeState extends State<DHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/photo6278066036184034287.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Send packages with Connect',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                  color: Colors.red, fontSize: 40,
                  //letterSpacing: .5
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Get it delivered in the time it takes to drive there',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                  color: Colors.red, fontSize: 17,
                  //letterSpacing: .5
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(Prinfo());
              },
              child: Container(
                height: 50,
                color: Colors.red,
                child: Center(
                    child: Text(
                  'Send a package',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.white, fontSize: 22,
                      //letterSpacing: .5
                    ),
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
