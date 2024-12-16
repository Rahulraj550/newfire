import 'package:flutter/material.dart';
import 'login.dart';

class HotelRegistration extends StatefulWidget {
  const HotelRegistration({super.key});

  @override
  State<HotelRegistration> createState() => _HotelRegistrationState();
}

class _HotelRegistrationState extends State<HotelRegistration> {
  bool showPass1 = true;
  bool showPass2 = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? pass;
  String? showpass;
  String? fullname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white38,
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 80),
                  child: Text(
                    "Registration",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    onSaved: (ema) {
                      fullname = ema;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_3),
                      hintText: "Full Name",
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "Enter full name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    onSaved: (ema) {
                      email = ema;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: "Email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (email) {
                      if (email!.isEmpty ||
                          !email.contains('@') ||
                          !email.contains('.')) {
                        return "Enter a valid e-mail";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    onSaved: (ema) {
                      pass = ema;
                    },
                    obscureText: showPass1,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPass1 = !showPass1;
                          });
                        },
                        icon: Icon(
                          showPass1 ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (password1) {
                      if (password1!.isEmpty) {
                        return "Enter a valid password";
                      } else if (password1.length < 8) {
                        return "Password must have at least 8 characters";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    onSaved: (ema) {
                      showpass = ema;
                    },
                    obscureText: showPass2,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPass2 = !showPass2;
                          });
                        },
                        icon: Icon(
                          showPass2 ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (password2) {
                      if (password2!.isEmpty || password2.length < 8) {
                        return "Enter a valid password";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HoteluiLoginpage(),
                        ),
                      );
                    }
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
