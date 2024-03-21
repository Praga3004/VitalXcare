import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vitalxcare/signUp.dart';
import 'package:flutter_svg/flutter_svg.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  Color buttonColor = Color(0xFF1A4563);
  Color hoverColor = Colors.lightBlue;
  bool icon_vis = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                      height: 700,
                      child: Column(
                        children: [
                          Text(
                            "Welcome to Login",
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
                            "login your account.",
                            style: TextStyle(
                                color: Color(0xFF1A4563),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
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
                          SizedBox(
                            height: 20,
                          ),
                          Text.rich(TextSpan(
                              text: "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1A4563),
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signUp()),
                                  );
                                })),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 44,
                            width: double.infinity,
                            child: ElevatedButton(
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
                                    borderRadius: BorderRadius
                                        .zero, // Remove rounded corners
                                  ),
                                ),
                              ),
                              child: Text(
                                "Login",
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
                          SizedBox(
                            height: 25,
                          ),
                          Text.rich(TextSpan(
                              text: "Doctor Login:",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF757F8E)),
                              children: [
                                TextSpan(
                                  text: " Login ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0060F7),
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => logIn()),
                                      );
                                    },
                                ),
                                TextSpan(
                                  text: "/",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF1A4563),
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: " SignUp",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0060F7),
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signUp()),
                                      );
                                    },
                                )
                              ])),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(TextSpan(
                              text: "Don't have any account:",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF757F8E)),
                              children: [
                                TextSpan(
                                  text: " SignUp",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF0060F7),
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signUp()),
                                      );
                                    },
                                )
                              ])),
                          SizedBox(
                            height: 25,
                          ),
                          Text.rich(TextSpan(
                            text: "Or Continue With:",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF757F8E)),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(color: Colors.black)),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      'assert/google_logo.svg',
                                      width: 24,
                                      height: 24), // Google icon
                                  onPressed: () {
                                    // Handle Google button tap
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(color: Colors.black)),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      'assert/facebook_logo.svg',
                                      width: 24,
                                      height: 24),
                                  onPressed: () {
                                    // Handle Google button tap
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(color: Colors.black)),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      'assert/apple_logo.svg',
                                      width: 24,
                                      height: 24), // Google icon
                                  onPressed: () {
                                    // Handle Google button tap
                                  },
                                ),
                              ),
                            ],
                          )
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
                        height: 700,
                        child: Column(
                          children: [
                            Text(
                              "Welcome to Login",
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
                              "login your account.",
                              style: TextStyle(
                                  color: Color(0xFF1A4563),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
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
                            SizedBox(
                              height: 15,
                            ),
                            Text.rich(TextSpan(
                                text: "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF1A4563),
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => signUp()),
                                    );
                                  })),
                            SizedBox(
                              height: 44,
                              width: double.infinity,
                              child: ElevatedButton(
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
                                      borderRadius: BorderRadius
                                          .zero, // Remove rounded corners
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Login",
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
                                text: "Doctor Login:",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF757F8E)),
                                children: [
                                  TextSpan(
                                    text: " Login ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF0060F7),
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => logIn()),
                                        );
                                      },
                                  ),
                                  TextSpan(
                                    text: "/",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF1A4563),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: " SignUp",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF0060F7),
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => signUp()),
                                        );
                                      },
                                  )
                                ])),
                            SizedBox(
                              height: 25,
                            ),
                            Text.rich(TextSpan(
                                text: "Don't have any account:",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF757F8E)),
                                children: [
                                  TextSpan(
                                    text: " SignUp",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF0060F7),
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => signUp()),
                                        );
                                      },
                                  )
                                ])),
                            SizedBox(
                              height: 25,
                            ),
                            Text.rich(TextSpan(
                              text: "Or Continue With:",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF757F8E)),
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(color: Colors.black)),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                        'assert/google_logo.svg',
                                        width: 24,
                                        height: 24), // Google icon
                                    onPressed: () {
                                      // Handle Google button tap
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(color: Colors.black)),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                        'assert/facebook_logo.svg',
                                        width: 24,
                                        height: 24), // Google icon
                                    onPressed: () {
                                      // Handle Google button tap
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(color: Colors.black)),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                        'assert/apple_logo.svg',
                                        width: 24,
                                        height: 24), // Google icon
                                    onPressed: () {
                                      // Handle Google button tap
                                    },
                                  ),
                                ),
                              ],
                            )
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
      ),
    );
  }
}
