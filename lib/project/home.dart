import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? email;

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  void getEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      email = user?.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          email ?? "No email registered",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );

  }
}
