import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fmdelivery/app/modules/defaulthome/defaulthome.dart';
import 'package:fmdelivery/app/modules/profile/createprofile.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final firestoreInstance = FirebaseFirestore.instance;

class Signinup extends StatefulWidget {
  @override
  _SigninupState createState() => _SigninupState();
}

class _SigninupState extends State<Signinup> {
  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    return buildUnAuthScreen();
  }

  Future<UserCredential> signInWithGoogleee() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // internetCheck() async {
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       //   print('connected');
  //     }
  //   } on SocketException catch (_) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => ConnectionLostScreen()),
  //     );
  //   }
  // }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    // print("User Signed Out");
  }

  Widget buildUnAuthScreen() {
    return Scaffold(
      // backgroundColor: Color(0xff050607),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Image.asset(
              'assets/delivery-man-riding-red-scooter-illustration_9845-14.jpg',
              //  height: 500,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  EasyLoading.show(status: 'Signing In');
                  signInWithGoogleee().then((result) async {
                    if (result != null) {
                      print(result);
                      // print(result.user.photoURL);
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString('profilePHOTO', result.user.photoURL);
                      pref.setString('userEMAIL', result.user.email);
                      pref.setString('full_name', result.user.displayName);
                      //pref.se
                      EasyLoading.dismiss();
                      if (result.additionalUserInfo.isNewUser == true) {
                        pref.setBool('islogedin', true);
                        firestoreInstance
                            .collection("users")
                            .doc(result.user.email)
                            .set({'profile': result.additionalUserInfo.profile},
                                SetOptions(merge: true)).then((_) async {});
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DHome()),
                        );
                      } else {
                        pref.setBool('islogedin', true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DHome()),
                        );
                      }
                    } else {
                      signOutGoogle();
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Sign Up with Google',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/g.png'),
                            )),
                      ),
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// bool isAuth = false;

// @override
// Widget build(BuildContext context) {
//   return buildUnAuthScreen();
// }

Future<UserCredential> signInWithGoogleee() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  // print("User Signed Out");
}

// Widget buildUnAuthScreen() {
//   return Scaffold(
//     // backgroundColor: Color(0xff050607),
//     body: SafeArea(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //crossAxisAlignment: CrossAxisAlignment.,
//         children: [
//           Image.asset(
//             'assets/animation_500_km7t1fyh.gif',
//             //  height: 500,
//             width: 300,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () async {
//                 EasyLoading.show(status: 'Signing In');
//                 signInWithGoogleee().then((result) async {
//                   if (result != null) {
//                     print(result);
//                     // print(result.user.photoURL);
//                     SharedPreferences pref =
//                         await SharedPreferences.getInstance();
//                     pref.setString('profilePHOTO', result.user.photoURL);
//                     pref.setString('userEMAIL', result.user.email);
//                     pref.setString('full_name', result.user.displayName);
//                     //pref.se
//                     EasyLoading.dismiss();
//                     if (result.additionalUserInfo.isNewUser == true) {
//                       Get.to(CreateProfile());
//                     } else {
//                       pref.setBool('islogedin', true);
//                       Get.to(DHome());
//                     }
//                   } else {
//                     signOutGoogle();
//                   }
//                 });
//               },
//               child: Container(
//                 height: 50,
//                 width: 250,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.red,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 3,
//                       offset: Offset(0, 1), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                     child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text(
//                       'Sign Up with Google',
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontFamily: 'Gilroy',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 3,
//                                 offset:
//                                     Offset(0, 1), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           child: Image.asset('assets/g.png')),
//                     ),
//                   ],
//                 )),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
