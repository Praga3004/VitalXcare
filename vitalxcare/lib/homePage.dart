// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vitalxcare/logIn.dart';
import 'package:vitalxcare/notification.dart';
import 'package:vitalxcare/report.dart';
import 'package:vitalxcare/account.dart';
import 'dart:ffi';

import 'package:vitalxcare/schedule.dart';

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
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => logIn()));
  }

  final List<Widget> slides_1 = [
    Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF1C6BA4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF155A96),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Tue",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "9:30",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Dr Minoko",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Galappathi",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              icon: Icon(Icons.more_horiz),
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 193, 134),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE09F1F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "13",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Wed",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "10:30",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Dr Anuruddha",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Paadeniya",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              icon: Icon(Icons.more_horiz),
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 112, 234, 171),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 1, 104, 47),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Tue",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "9:30",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Dr Minoko",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Galappathi",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              icon: Icon(Icons.more_horiz),
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  ];

  final List<Widget> slides = [
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFD7DEEA),
        borderRadius: BorderRadius.circular(20), // Set circular radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is Cancer?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Oldenburg')),
            Text(
                'Cancer is a disease caused when cells divide uncontrollably and spread into ...',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Oldenburg')),
            Text('see more >>>',
                style: TextStyle(
                    color: Colors.blue, fontSize: 8, fontFamily: 'Oldenburg')),
          ],
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFD7DEEA),
        borderRadius: BorderRadius.circular(20), // Set circular radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is hepatitis?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Oldenburg')),
            Text(
                'Hepatitis means inflammation of the liver. When the liver is inflamed or damaged, its function  ...',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Oldenburg')),
            Text('see more >>>',
                style: TextStyle(
                    color: Colors.blue, fontSize: 8, fontFamily: 'Oldenburg')),
          ],
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFD7DEEA),
        borderRadius: BorderRadius.circular(20), // Set circular radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is ebola?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Oldenburg')),
            Text(
                'Ebola disease is the term for a group of deadly diseases in people caused by four ebolaviruses ...',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Oldenburg')),
            Text('see more >>>',
                style: TextStyle(
                    color: Colors.blue, fontSize: 8, fontFamily: 'Oldenburg')),
          ],
        ),
      ),
    ),
  ];

  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    schedule(),
    Reportpage(),
    Notificationpage()
  ];
  @override
  Widget build(BuildContext context) {
    row_width = MediaQuery.of(context).size.width;
    return MaterialApp( debugShowCheckedModeBanner: false,
      // theme: ThemeData(textTheme: TextTheme(bodyLarge: TextStyle(fontFamily: 'NunitoSans') )),
      home: Scaffold(
        backgroundColor: Color(0xFFDCEDF9),
        body: Container(
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
                            onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Account()),
            );},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Center(
                                child: Icon(
                              Icons.person, color: Colors.black,
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
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
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
                              backgroundColor: Color(0xFFB8DFFF),
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
                              backgroundColor: Color(0XFFFCF1DB),
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
                              backgroundColor: Color(0xFFB8DFFF),
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
                              backgroundColor: Color(0xFFB8DFFF),
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: PageView(
                    children: slides,
                  ),
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Upcoming Appointments",
                  style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: PageView(children: slides_1),
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // Set your desired color here
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Color(0xFFDCEDF9),
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _pages[value]),
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Schedules',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }
}
