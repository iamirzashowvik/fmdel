import 'package:flutter/material.dart';
import 'package:fmdelivery/app/modules/package/psinfo.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Prinfo extends StatefulWidget {
  @override
  _PrinfoState createState() => _PrinfoState();
}

class _PrinfoState extends State<Prinfo> {
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Who\'s receiving the package?',
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
                          sname: sname,
                          name: 'Name',
                        ),
                        TFF(
                          sname: sphone,
                          name: 'Phone Number',
                          textInputType: TextInputType.number,
                        ),
                        // TFF(
                        //   sname: supozila,
                        //   name: 'Upozila',
                        //   //textInputType: TextInputType.number,
                        // ),
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
                                Get.to(Psinfo([
                                  sname.text,
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
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}

class TFF extends StatelessWidget {
  const TFF({Key key, this.sname, this.name, this.textInputType})
      : super(key: key);

  final TextEditingController sname;
  final String name;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.comfortaa(
              textStyle: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold
                  //letterSpacing: .5
                  ),
            ),
          ),
          TextFormField(
            keyboardType: textInputType,
            controller: sname,
            validator: (value) {
              if (value.isEmpty) {
                return '$name can not be empty';
              }

              return null;
            },
            decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                // borderRadius: BorderRadius.circular(10)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                // borderRadius: BorderRadius.circular(10)
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red[300], width: 0.0),
                //  borderRadius: BorderRadius.circular(10)
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red[300], width: 0.0),
                //  borderRadius: BorderRadius.circular(10)
              ),
              filled: true,
              border: InputBorder.none,
              hintText: 'Enter $name',
            ),
          ),
        ],
      ),
    );
  }
}
