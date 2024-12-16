import 'package:firebasepromax/firebase_basics/fire_authentication.dart';
import 'package:firebasepromax/firebase_basics/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HoteluiLoginpage(),
  ));
}

class HoteluiLoginpage extends StatefulWidget {
  const HoteluiLoginpage({super.key});

  @override
  State<HoteluiLoginpage> createState() => _HoteluiLoginpageState();
}

class _HoteluiLoginpageState extends State<HoteluiLoginpage> {
  bool showpass = true;
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 50),
                child: Text("Login Page"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, top: 30, right: 70),
                child: TextFormField(
                  onSaved: (ema) {
                    username = ema;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (username) {
                    if (username!.isEmpty ||
                        !username.contains('@') ||
                        !username.contains('.')) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, top: 30, right: 70),
                child: TextFormField(
                  onSaved: (ema) {
                    password = ema;
                  },
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                      icon: Icon(
                        showpass ? Icons.visibility_off : Icons.visibility,
                        color: showpass ? Colors.black : Colors.blue,
                      ),
                    ),
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "Invalid password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  foregroundColor: Colors.red,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    FireHelper().signIn(mail: username!, pass: password!).then((value) {
                      if (value == null) {
                        Get.to(HotelUI());
                      } else {
                        Get.snackbar("User not found", "Please check your credentials");
                      }
                    });
                  }
                },
                child: Text("Login"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HotelRegistration()),
                    );
                  },
                  child: Text("Not a user? Create an account...!"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HotelUI()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
