import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:vitalxcare/logIn.dart";
import 'package:hash/hash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  int buttonValue = 1;
  bool icon_vis = true;
  bool nam = true;
  bool emai = true;
  bool phon = true;
  bool pass = true;
  bool confpass = true;
  String name = "";
  String email = "";
  int phone = 0;
  String password = "";
  String confirmpassword = "";
  TextEditingController Con1 = TextEditingController();
  TextEditingController Con2 = TextEditingController();
  TextEditingController Con3 = TextEditingController();
  TextEditingController Con4 = TextEditingController();
  TextEditingController Con5 = TextEditingController();
  // Future<void> registerUser(
  //     String email, String password, String name, int phone) async {
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     final user = credential.user;

  //     // Hash the password securely before storing
  //     final hashedPassword = password;
  //     String usertype = buttonValue == 1 ? 'Doctor' : 'Patient';
  //     // Prepare user profile data for Firestore (excluding password)
  //     Map<String, dynamic> userData = {
  //       'uid': user!.uid,
  //       'name': name,
  //       'email': email,
  //       'phone': phone,
  //       'UserType': usertype
  //       // Consider storing email in a separate collection with stricter rules
  //       // Add other profile details as needed
  //     };

  //     // Add user profile data to Firestore collection
  //     await FirebaseFirestore.instance.collection('users').add(userData);

  //     print('User registered successfully!');
  //   } on FirebaseAuthException catch (error) {
  //     print('Registration failed: ${error.code}');
  //   } catch (error) {
  //     print('Error registering user: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Color(0xFF1A4563);
    Color hoverColor = Colors.lightBlue;
    bool is_name(String text) {
      return RegExp(r'^[a-zA-Z\s]+$').hasMatch(text);
    }

    bool is_email(String email) {
      final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return emailRegex.hasMatch(email);
    }

    bool is_phone(String text) {
      return RegExp(r'^[0-9]{10}$').hasMatch(text);
    }

    bool validatepassword(String password) {
      if (password.length < 8) {
        return false; // Password must be at least 8 characters long
      }

      bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
      bool hasLowercase = RegExp(r'[a-z]').hasMatch(password);
      bool hasSpecialChars =
          RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

      return hasUppercase && hasLowercase && hasSpecialChars;
    }

    void toggleButtons() {
      setState(() {
        buttonValue = buttonValue == 1 ? 0 : 1;

        print(buttonValue);
      });
    }

    return MaterialApp(home: Scaffold(
      body: Center(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxHeight > 700) {
            return Container(
              color: Color(0xFFDCEDF9),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 300,
                    height: 1000,
                    child: Column(
                      children: [
                        Text(
                          "Create new account",
                          style: TextStyle(
                              color: Color(0xFF1A4563),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please fill out the below details to ",
                          style: TextStyle(
                              color: Color(0xFF1A4563),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "create your new account.",
                          style: TextStyle(
                              color: Color(0xFF1A4563),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: toggleButtons,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return hoverColor;
                                    }
                                    return buttonValue == 0
                                        ? Colors.blueGrey
                                        : buttonColor;
                                  },
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Doctor",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: toggleButtons,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return hoverColor;
                                    }
                                    return buttonValue == 1
                                        ? Colors.blueGrey
                                        : buttonColor;
                                  },
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Patient",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                    color: Color(0xFF1A4563),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 44,
                                child: TextField(
                                  controller: Con1,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder()),
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !nam,
                          child: Text(
                            'Name Invalid',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                    color: Color(0xFF1A4563),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 44,
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: Con2,
                                  onTap: () => {setState(() {})},
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder()),
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !emai,
                          child: Text(
                            'Email Invalid',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone no.',
                                style: TextStyle(
                                    color: Color(0xFF1A4563),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 44,
                                child: TextField(
                                  controller: Con3,
                                  onTap: () => {setState(() {})},
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder()),
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !phon,
                          child: Text(
                            'Phone Number Invalid',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                    color: Color(0xFF1A4563),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 44,
                                child: TextField(
                                  controller: Con4,
                                  onTap: () => {setState(() {})},
                                  obscureText: icon_vis,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              icon_vis = !icon_vis;
                                            });
                                          },
                                          icon: Icon(!icon_vis
                                              ? Icons.visibility_off
                                              : Icons.visibility)),
                                      border: OutlineInputBorder()),
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !pass,
                          child: Text(
                            'Password Invalid',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Confirm password',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 125, 131),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 44,
                                child: TextField(
                                  controller: Con5,
                                  onTap: () => {setState(() {})},
                                  obscureText: icon_vis,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              icon_vis = !icon_vis;
                                            });
                                          },
                                          icon: Icon(!icon_vis
                                              ? Icons.visibility_off
                                              : Icons.visibility)),
                                      border: OutlineInputBorder()),
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !confpass,
                          child: Text(
                            'Confim Password',
                            style: TextStyle(fontSize: 10.0, color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 44,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (is_name(Con1.text)) {
                                  name = Con1.text;
                                  print(name);
                                  nam = true;
                                } else {
                                  nam = false;
                                  return;
                                }
                                if (is_email(Con2.text)) {
                                  email = Con2.text;
                                  emai = true;
                                  print(email);
                                } else {
                                  emai = false;
                                  return;
                                }
                                if (is_phone(Con3.text)) {
                                  phone = int.parse(Con3.text);
                                  phon = true;
                                  print(phone);
                                } else {
                                  phon = false;
                                  return;
                                }
                                if (validatepassword(Con4.text)) {
                                  password = Con4.text;
                                  pass = true;
                                  print(password);
                                } else {
                                  pass = false;
                                  return;
                                }
                                if (validatepassword(Con5.text)) {
                                  confirmpassword = Con5.text;
                                  confpass = true;
                                  print(confirmpassword);
                                  
                                } else {
                                  confpass = false;
                                  return;
                                }
                                // registerUser(email, password, name, phone);
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return hoverColor;
                                  }
                                  return buttonColor;
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius
                                      .zero, // Remove rounded corners
                                ),
                              ),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text.rich(TextSpan(
                            text: "Already have a account.",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF757F8E)),
                            children: [
                              TextSpan(
                                  text: "login",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF1A4563),
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => logIn()),
                                      );
                                    })
                            ]))
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Container(
                color: Color(0xFFDCEDF9),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      height: 1000,
                      child: Column(
                        children: [
                          Text(
                            "Create new account",
                            style: TextStyle(
                                color: Color(0xFF1A4563),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Please fill out the below details to ",
                            style: TextStyle(
                                color: Color(0xFF1A4563),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "create your new account.",
                            style: TextStyle(
                                color: Color(0xFF1A4563),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return hoverColor;
                                      }
                                      return buttonColor;
                                    },
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Remove rounded corners
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Doctor",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return hoverColor;
                                      }
                                      return buttonColor;
                                    },
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Remove rounded corners
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Patient",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Color(0xFF1A4563),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 44,
                                  child: TextField(
                                    controller: Con1,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder()),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !nam,
                            child: Text(
                              'Name Invalid',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                      color: Color(0xFF1A4563),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 44,
                                  child: TextField(
                                    controller: Con2,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder()),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !emai,
                            child: Text(
                              'Email Invalid',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone no.',
                                  style: TextStyle(
                                      color: Color(0xFF1A4563),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 44,
                                  child: TextField(
                                    controller: Con3,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder()),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !phon,
                            child: Text(
                              'Phone Number invalid',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Color(0xFF1A4563),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 44,
                                  child: TextField(
                                    controller: Con4,
                                    obscureText: icon_vis,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                icon_vis = !icon_vis;
                                              });
                                            },
                                            icon: Icon(!icon_vis
                                                ? Icons.visibility_off
                                                : Icons.visibility)),
                                        border: OutlineInputBorder()),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !pass,
                            child: Text(
                              'Password Invalid',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Confirm password',
                                  style: TextStyle(
                                      color: Color(0xFF1A4563),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 44,
                                  child: TextField(
                                    controller: Con5,
                                    obscureText: icon_vis,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                icon_vis = !icon_vis;
                                              });
                                            },
                                            icon: Icon(!icon_vis
                                                ? Icons.visibility_off
                                                : Icons.visibility)),
                                        border: OutlineInputBorder()),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !confpass,
                            child: Text(
                              'Confirm password Invalid',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 44,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (is_name(Con1.text)) {
                                  name = Con1.text;
                                  print(name);
                                  nam = true;
                                } else {
                                  nam = false;
                                  return;
                                }
                                if (is_email(Con2.text)) {
                                  email = Con2.text;
                                  emai = true;
                                  print(email);
                                } else {
                                  emai = false;
                                  return;
                                }
                                if (is_phone(Con3.text)) {
                                  phone = int.parse(Con3.text);
                                  phon = true;
                                  print(phone);
                                } else {
                                  phon = false;
                                  return;
                                }
                                if (validatepassword(Con4.text)) {
                                  password = Con4.text;
                                  pass = true;
                                  print(password);
                                } else {
                                  pass = false;
                                  return;
                                }
                                if (validatepassword(Con5.text)) {
                                  confirmpassword = Con5.text;
                                  confpass = true;
                                  print(confirmpassword);
                                } else {
                                  confpass = false;
                                  return;
                                }
                                // registerUser(email, password, name, phone);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return hoverColor;
                                    }
                                    return buttonColor;
                                  },
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Remove rounded corners
                                  ),
                                ),
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text.rich(TextSpan(
                              text: "Already have a account.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF757F8E)),
                              children: [
                                TextSpan(
                                    text: "login",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF1A4563),
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => logIn()),
                                        );
                                      })
                              ]))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }),
      ),
    ));
  }
}
