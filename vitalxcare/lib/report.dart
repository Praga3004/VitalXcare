import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vitalxcare/homePage.dart';
import 'package:vitalxcare/notification.dart';
import 'package:vitalxcare/schedule.dart';
import 'components/button.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({super.key});

  @override
  State<Reportpage> createState() => _ReportpageState();
}

class _ReportpageState extends State<Reportpage> {
  int _selectedIndex = 2;
  final List<Widget> _pages = [
    HomePage(),
    schedule(),
    Reportpage(),
    Notificationpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  automaticallyImplyLeading: false,backgroundColor: Color(0xFFDCEDF9),),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFDCEDF9),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //heart rate
              Button(
                onTap: () {},
                msg: 'Heart Rate',
                content: '96 Bpm',
                suffixicon: Icons.monitor_heart,
                button_color: Colors.pinkAccent,
                fontSize: 30,
                // color: Color.fromARGB(255, 204, 186, 186),
              ),
              SizedBox(height: 20),

              // blood group and weight
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.redAccent,
                      ),
                      height: 100,
                      width: 140,
                      padding: EdgeInsets.all(10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.bloodtype,color: Colors.white,),
                          Text("blood group\n       A+", style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      height: 100,
                      width: 130,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Icon(Icons.monitor_weight,color: Colors.yellow,),
                            Text("Weight\n    65", style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              //show family member
              Text(
                "Showing Family Member",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),SizedBox(  height: 50,
                child: PageView(children: [ Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[400],
                    ),
                  
                    width: 400,
                    child: Center(child: Text("Mother" ,style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                  ),
                ), Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[400],
                    ),
                  
                    width: 400,
                    child: Center(child: Text("Father", style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                  ),
                ), Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[400],
                    ),
                  
                    width: 400,
                    child: Center(child: Text("Sister", style:
                          TextStyle(fontSize:15, fontWeight: FontWeight.bold),)),
                  ),
                ),],),
              ),
             
              SizedBox(height: 20),
              //report history and seeall
              Padding(padding: EdgeInsetsDirectional.symmetric(horizontal:30),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Report history",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),Text("See All...",style: TextStyle(color: Colors.blue),)
                  ],
                ),
              ),

              //general health 2times
              SizedBox(height: 20),
              Button(
                onTap: () {},icon: Icons.list,content: '4 files',suffixicon: Icons.more_vert,sufSize: 20,icon_color: Colors.lightBlue,
                msg: "General Health",
                // color: Color.fromARGB(255, 173, 171, 171),
              ),

              SizedBox(height: 20),
              Button(
                onTap: () {}, button_color: Colors.white,icon: Icons.list,content: '6 files',suffixicon: Icons.more_vert,sufSize: 20,icon_color: Colors.blueGrey,
                msg: "General Health",
                // color: Color.fromARGB(255, 173, 171, 171),
              ),

              SizedBox(height: 20),
              Button(
                onTap: () {},icon: Icons.list,content: '8 files',suffixicon: Icons.more_vert,sufSize: 20,icon_color: Colors.amberAccent,
                msg: "General Health",
                // color: Color.fromARGB(255, 173, 171, 171),
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
    );
  }
}
