import 'package:flutter/material.dart';
import 'package:fmdelivery/app/modules/package/cc.dart';
import 'package:fmdelivery/app/modules/package/prinfo.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Psinfo extends StatefulWidget {
  final List prinfo;
  Psinfo(this.prinfo);
  @override
  _PsinfoState createState() => _PsinfoState();
}

class _PsinfoState extends State<Psinfo> {
  final _loginForm = GlobalKey<FormState>();
  TextEditingController sname = TextEditingController();
  TextEditingController sphone = TextEditingController();
  // TextEditingController supozila = TextEditingController();
  TextEditingController sunion = TextEditingController();
  TextEditingController sadetails = TextEditingController();
  String supozila;

  List<String> typeNeg = [
    "Upozila 1",
    "Upozila 2",
    "Upozila 3",
    "Upozila 4",
    "Upozila 5",
  ];
  @override
  Widget build(BuildContext context) {
    print(widget.prinfo);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Picing up the package?',
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
                  'The driver may contact the recipient to complete the delivery',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.red, fontSize: 17,
                      //letterSpacing: .5
                    ),
                  ),
                ),
              ),
              Form(
                  key: _loginForm,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TFF(
                          sname: sphone,
                          name: 'Phone Number',
                          textInputType: TextInputType.number,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DropdownButtonFormField<String>(
                            value: supozila,
                            hint: Text("Upozila"),
                            onChanged: (String newValue) {
                              setState(() {
                                supozila = newValue;
                              });
                            },
                            validator: (String value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please select Upozila';
                              }
                            },
                            items: typeNeg
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onSaved: (val) => setState(() => supozila = val),
                          ),
                        ),
                        TFF(
                          sname: sunion,
                          name: 'Union',
                          //textInputType: TextInputType.number,
                        ),
                        TFF(
                          sname: sadetails,
                          name: 'Address Details',
                          //textInputType: TextInputType.number,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              //  Get.to(Prinfo());
                              if (_loginForm.currentState.validate()) {
                                Get.to(CC(widget.prinfo, [
                                  sphone.text,
                                  supozila,
                                  sunion.text,
                                  sadetails.text
                                ]));
                              } else {}
                            },
                            child: Container(
                              height: 50,
                              color: Colors.red,
                              child: Center(
                                  child: Text(
                                'Send the package',
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
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
