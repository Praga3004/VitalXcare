// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:vitalxcare/homePage.dart';
import 'package:vitalxcare/report.dart';
import 'package:vitalxcare/schedule.dart';
import 'components/button.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  int _selectedIndex = 3;
  final List<Widget> _pages = [
    HomePage(),
    schedule(),
    Reportpage(),
    Notificationpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFDCEDF9),
        title: Text(
          "Notifications",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),        automaticallyImplyLeading: false,

      ),
      body: Container(color: Color(0xFFDCEDF9),
        child: Column(
          children: [
            SizedBox(height: 10),
            //button to show schedules
            Button(
              onTap: () {
                //Navigator.pop(context);
                Navigator.pushNamed(context, '/schedule');
              },icon: Icons.schedule,icon_color: Color(0xFFDCEDF9),
              msg: '            2 Schedules!!',content: 'check the shedules today',
            ),
            SizedBox(height: 10),
        
            //button to show messages
            Button(
              onTap: () {
                //Navigator.pop(context);
                Navigator.pushNamed(context, '/schedule');
              },icon: Icons.message,icon_color: Color(0xFFF4E3EB),
              msg: '            6 Messages! ',content: 'check the shedules today',
            ),
            SizedBox(height: 10),
        
            //button to show medicine
            Button(
              onTap: () {
                //Navigator.pop(context);
                Navigator.pushNamed(context, '/schedule');
              },icon: Icons.medication_liquid,icon_color: Color(0xFFFCF1AB),
              msg: '            Medicine!! ',content: ' check the shedules today',

            ),
            SizedBox(height: 10),
        
            //button to show medical history
            Button(
              onTap: () {
                //Navigator.pop(context);
                Navigator.pushNamed(context, '/schedule');
              },icon: Icons.medical_information,icon_color: Color(0xFFDAF7FF),
              msg: '            Medical history',content: 'check the shedules today',
            ),
            SizedBox(height: 10),
          ],
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
    );
  }
}
