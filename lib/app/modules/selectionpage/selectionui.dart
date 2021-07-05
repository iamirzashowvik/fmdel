import 'package:flutter/material.dart';
import 'package:fmdelivery/app/modules/defaulthome/defaulthome.dart';
import 'package:fmdelivery/app/modules/signinup/signinup.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Selection extends StatefulWidget {
  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  getShare() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.getBool('islogedin') == true
        ? Get.to(DHome())
        : Get.to(Signinup());
  }

  @override
  void initState() {
    getShare();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
