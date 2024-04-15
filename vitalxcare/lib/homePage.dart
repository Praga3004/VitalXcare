import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vitalxcare/logIn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String _userName = "";
  String _searchText = '';
  @override
  void initState() {
    super.initState();

    Details();
  }

  TextEditingController _controller = TextEditingController();

  double row_width = 0;
  Future<void> Details() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        setState(() {
          _userName = user.displayName ?? 'User';
        });
      } else {
        setState(() {
          _userName = 'User';
        });
      }
    } catch (e) {
      print('Error retrieving user display name: $e');
    }
  }

  String truncateText(String text) {
    if (text.length <= 10) {
      return text;
    } else {
      return text.substring(0, 10) + "...";
    }
  }

  Future<void> signout_() async {
    auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => logIn()));
  }

  @override
  Widget build(BuildContext context) {
    row_width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xFFDCEDF9),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Hello, welcome to ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Text(
                                "vitalXcare",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            truncateText(_userName),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width / 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Center(
                                child: Icon(
                              Icons.person,
                            ))),
                      ),
                    ]),
                SizedBox(height: 10),
                Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          labelText: 'Search Medical',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          suffixIcon: Icon(Icons.filter_list)),
                      onChanged: (value) {
                        setState(() {
                          _searchText = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    // Here you can display your search results based on `_searchText`
                  ],
                ),
                Text(
                  "Services",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFB6E0FD),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                              child: Image.asset(
                                'assert/Doctor.jpeg', width: 70,
                                height: 70, // Path to your JPEG image
                                // Adjust the height as needed
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFAF0DB),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                              child: Image.asset(
                                'assert/medicine.jpeg', width: 70,
                                height: 70, // Path to your JPEG image
                                // Adjust the height as needed
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD6F6FF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Image.asset(
                            'assert/info.jpeg', width: 70,
                            height: 70, // Path to your JPEG image
                            // Adjust the height as needed
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF2E3E9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Image.asset(
                                'assert/Bacteria.jpeg',
                                width: 70,
                                height: 70, // Path to your JPEG image
                                // Adjust the height as needed
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFB6E0FD),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                              child: Image.asset(
                                'assert/music.jpeg',
                                width: 70,
                                height: 70,

                                /// Path to your JPEG image
                                // Adjust the height as needed
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFB6E0FD),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                              child: Image.asset(
                                'assert/food.jpeg',
                                width: 70,
                                height: 70, // Path to your JPEG image
                                // Adjust the height as needed
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                ElevatedButton(onPressed: signout_, child: Text("LogOut"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
