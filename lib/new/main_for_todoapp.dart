import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'new.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA-_LftbodSGqa1n300e6y4hJYjQql04_w",
        appId: "1:925701833118:android:2f11147ce43cfd4af4968f",
        messagingSenderId:"",
        projectId: "fir-pro-max",
          storageBucket: "fir-pro-max.firebasestorage.app"
      )

  );
  runApp(GetMaterialApp(
    home: todofirebase(),
  ));
}