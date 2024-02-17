import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:vitalxcare/logIn.dart";

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  int buttonValue = 1;
  bool icon_vis = false;
  @override
  Widget build(BuildContext context) {
    Color buttonColor = Color(0xFF1A4563);
    Color hoverColor = Colors.lightBlue;

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
                    height: 700,
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
                                    borderRadius: BorderRadius.zero,
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
                                    borderRadius: BorderRadius.zero,
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
                                'Phone no.',
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
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              icon_vis = !icon_vis;
                                            });
                                          },
                                          icon: Icon(icon_vis
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
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              icon_vis = !icon_vis;
                                            });
                                          },
                                          icon: Icon(icon_vis
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
                        SizedBox(
                          height: 44,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
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
                      height: 700,
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
                                      borderRadius: BorderRadius
                                          .zero, // Remove rounded corners
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
                                      borderRadius: BorderRadius
                                          .zero, // Remove rounded corners
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
                                  'Phone no.',
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
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                icon_vis = !icon_vis;
                                              });
                                            },
                                            icon: Icon(icon_vis?Icons.visibility_off:Icons.visibility)),
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
                                  'Confirm password',
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
                                        suffixIcon: IconButton(
                                            onPressed: () {setState(() {
                                                icon_vis = !icon_vis;
                                              });},
                                            icon: Icon(icon_vis?Icons.visibility_off:Icons.visibility)),
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
