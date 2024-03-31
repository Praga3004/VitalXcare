import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vitalxcare/logIn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signout_() async {
    auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => logIn()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xFFDCEDF9),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Row(children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Hello, welcome to",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "vitalXcare",
                    style: TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(onPressed: signout_, child: Text("LogOut"))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
