import 'package:firebase_core/firebase_core.dart';
import 'package:firebasepromax/phone/gmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA-_LftbodSGqa1n300e6y4hJYjQql04_w",
        appId: "1:925701833118:android:b0c89986fcfc708af4968f",
        messagingSenderId:"",
        projectId: "fir-pro-max", )
  );
  runApp(GetMaterialApp(
    home: GooglesignINScreen(),
  ));
}