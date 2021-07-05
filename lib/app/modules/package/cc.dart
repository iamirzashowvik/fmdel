import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CC extends StatefulWidget {
  final List ps;
  final List pr;
  CC(this.pr, this.ps);

  @override
  _CCState createState() => _CCState();
}

class _CCState extends State<CC> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Pricing',
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    color: Colors.red, fontSize: 40,
                    //letterSpacing: .5
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '1. 80 Taka for less than 5 kg',
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          color: Colors.red, fontSize: 22,
                          //letterSpacing: .5
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '1. 150 Taka for less than 20 kg',
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          color: Colors.red, fontSize: 22,
                          //letterSpacing: .5
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '1. 200 Taka for above 25 kg',
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          color: Colors.red, fontSize: 22,
                          //letterSpacing: .5
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(title: 'Order Received');
                },
                child: Container(
                  height: 50,
                  color: Colors.red,
                  child: Center(
                      child: Text(
                    'Confirm Sending',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        color: Colors.white, fontSize: 22,
                        //letterSpacing: .5
                      ),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
