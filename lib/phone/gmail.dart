import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooglesignINScreen extends StatefulWidget {
  const GooglesignINScreen({super.key});

  @override
  State<GooglesignINScreen> createState() => _GooglesignINScreenState();
}

class _GooglesignINScreenState extends State<GooglesignINScreen> {
  ValueNotifier userCredential = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Google Sign-In Screen"),
        ),
        body: ValueListenableBuilder(
            valueListenable: userCredential,
            builder: (context, value, child) {
              return (userCredential.value == '' ||
                      userCredential.value == null)
                  ? Center(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: Image.asset(""),
                          onPressed: () async {
                            userCredential.value = await signInWithGoogle();
                            if (userCredential.value != null) {
                              print(userCredential.value.user!.email);
                            }
                          },
                        ),
                      ),
                    )
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1.5,
                                color: Colors.black,
                              ),
                            ),
                            child: Image.network(
                                userCredential.value.user!.photourl.toString()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(userCredential.value.user!.displayName
                              .toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(userCredential.value.user!.email.toString()),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                bool result = await SignOutFromGoogle();
                                if (result) userCredential.value = '';
                              },
                              child: const Text('logout'))
                        ],
                      ),
                    );
            }));
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount ? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      print('exception->$e');
    }
  }
}

Future<dynamic> SignOutFromGoogle() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } on Exception catch (_) {
    return false;
  }
}
