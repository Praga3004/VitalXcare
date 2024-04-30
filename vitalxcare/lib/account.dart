import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vitalxcare/account_settings.dart';
import 'package:vitalxcare/logIn.dart';
import 'components/button.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String _userName = '';
  @override
  void initState() {
    super.initState();

    Details();
  }

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

  Future<void> signout_() async {
    auth.signOut();
    Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (context) => logIn()),
  (route) => false, // This will remove all the previous routes
);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => logIn()));
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return MaterialApp( debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar( backgroundColor: Color(0xFFDCEDF9),leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,size: 30,),
          onPressed: () => Navigator.pop(context), // Navigate back on tap
        ),
      
      ),
      body:Container(
        color: Color(0xFFDCEDF9),
        child: Column(
          children: [
            Center(
              child: SizedBox(width: 100,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Center(
                        child: Icon(
                      Icons.person,color: Colors.black,
                    ))),
              ),
            ),
            Center(
              child: Text(
                _userName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width / 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Button(
              onTap: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Editprofile()),
            );
                print("Here");
              },
              icon: Icons.account_box,
              icon_color: Color(0xFFF4E3EB),
              msg: 'Account Settings',
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              onTap: () {
                //Navigator.pop(context);
                print("Here");
              },
              icon: Icons.history,
              icon_color: Colors.lightBlue,
              msg: 'Family Memeber',content: ' Medical History',
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              onTap: () {
                //Navigator.pop(context);
                print("Here");
              },
              icon: Icons.policy,
              icon_color: Colors.lightGreen,
              msg: 'Privacy Policy',
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              onTap: () {
                //Navigator.pop(context);
                print("Here");
              },
              icon: Icons.payment,
              icon_color: Colors.limeAccent,
              msg: 'Payment Settings',
            ),
            SizedBox(
              height: 10,
            ),Center(
              child: SizedBox(
                child: ElevatedButton(onPressed: signout_,child: Text("LogOut",style: TextStyle(color: Colors.black)),style: ElevatedButton.styleFrom(backgroundColor: Colors.white),),
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    ));
  }
}
