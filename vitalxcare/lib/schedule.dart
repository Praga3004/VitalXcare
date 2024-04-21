import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:vitalxcare/homePage.dart';
import 'package:vitalxcare/logIn.dart';

class schedule extends StatefulWidget {
  const schedule({Key? key}) : super(key: key);

  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [
    HomePage(),
    schedule(),
    HomePage(),
    logIn(),
  ];

  Row generateDatePages() {
    List<Widget> pages = [];

    // Get the current date
    DateTime now = DateTime.now();

    // Get the last day of the current month
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    // Iterate over each day until the end of the month
    for (int i = now.day; i <= lastDayOfMonth.day; i++) {
      // Create a DateTime object for the current day
      DateTime currentDate = DateTime(now.year, now.month, i);
      bool buttonPressed = false;

      // Format the date using intl package
      String formattedDate = DateFormat('dd').format(currentDate);

      // Format the day using intl package
      String formattedDay = DateFormat('EEEE').format(currentDate);
      formattedDay = formattedDay.substring(0, 3);

      // Create a page widget for the current date and day
      Widget page = Container(
        child: ElevatedButton(
          onPressed: () {
            buttonPressed=
            !buttonPressed;
            // Add onPressed functionality here if needed
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:buttonPressed? Color(0xFFA1BDD2):Color(0xFF1C6BA4), // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // BorderRadius
            ),
          ),
          child: Container(
            width: 70, // Set a fixed width for each date page

            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  formattedDay,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );

      // Add the page to the list of pages
      pages.add(page);
      pages.add(SizedBox(width: 10));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: pages,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Format the date using DateFormat
    String formattedDate = DateFormat('MMM d, yyyy').format(now);

    // Format the day of the week using DateFormat
    String formattedDay = DateFormat('EEEE').format(now);
    Row Pages = generateDatePages();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFDCEDF9),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Schedule',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.calendar_month)
                  ],
                ),
                SizedBox(height: 20),

                SizedBox(
                  height: 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Expanded(child: Pages)],
                  ),
                ),

                // Add your scheduling content here
                // For example, display a list of scheduled appointments
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
