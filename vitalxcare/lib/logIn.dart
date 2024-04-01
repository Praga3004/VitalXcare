import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vitalxcare/homePage.dart';
import 'package:vitalxcare/signUp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Color buttonColor = Color(0xFF1A4563);
  Color hoverColor = Colors.lightBlue;
  String message = '';
  bool icon_vis = true;

  String email = '';
  String password = '';

  TextEditingController con1 = TextEditingController();
  TextEditingController con2 = TextEditingController();

  bool verified = false;

  bool is_email(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Warning",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  void Message(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.lightGreenAccent,
          title: Text('Success', style: TextStyle(color: Colors.white)),
          content: Text('Reset link Sent To Email Successfully.',
              style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showEmailInputDialog(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlueAccent,
          title:
              Text('Enter Your Email', style: TextStyle(color: Colors.white)),
          content: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Enter the email that need to reset the password.',
                hintStyle: TextStyle(color: Colors.white)),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                String enteredEmail = emailController.text;
                // Do something with the entered email
                print('Entered Email: $enteredEmail');
                resetPassword(email: enteredEmail);

                Navigator.of(context).pop();
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      Message(context);
      return;
    } on FirebaseAuthException catch (err) {
      throw Exception(err.message.toString());
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> LoginIn_user(String email, String password) async {
    try {
      final cred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = cred.user;
      print("Login Succesfull");
      con1.text = '';
      con2.text = '';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (error) {
      print('Login  failed: ${error.code}');
    } catch (error) {
      print('Error Login user: $error');
    }
  }

  void _handleGoogleSignIn() async {
    try {
      // Trigger the Google sign-in flow.
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        // Obtain the GoogleSignInAuthentication object.
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential.
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential.
        final userCredential = await _auth.signInWithCredential(credential);

        // Access user information using userCredential.user
        print('Signed in succesfully}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // User cancelled the sign-in process.
        message = 'Google sign-in cancelled.';
        _showMyDialog();
      }
    } catch (e) {
      message = "Login Failed $e";
      print("Login Failed $e");
      _showMyDialog();
      // Handle the error appropriately.
    }
  }

  bool validatepassword(String password) {
    if (password.length < 8) {
      return false; // Password must be at least 8 characters long
    }

    bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    bool hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    bool hasSpecialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

    return hasUppercase && hasLowercase && hasSpecialChars;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Color(0xFFDCEDF9),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 300,
                    height:  MediaQuery.of(context).size.height,
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
                                  controller: con1,
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
                                  controller: con2,
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
                                _showEmailInputDialog(context);
                              })),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 44,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (is_email(con1.text)) {
                                  email = con1.text;
                                  message = '';
                                } else {
                                  message = con1.text == ''
                                      ? 'Please Enter Email ID'
                                      : 'Email Invalid';
                                  _showMyDialog();

                                  return;
                                }

                                if (validatepassword(con2.text)) {
                                  password = con2.text;
                                  message = "";
                                } else {
                                  message = con2.text == ''
                                      ? 'Please Enter Password'
                                      : 'Password Invalid';
                                  _showMyDialog();
                                  return;
                                }
                                LoginIn_user(email, password);
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
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF757F8E)),
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
                                icon: SvgPicture.asset('assert/google_logo.svg',
                                    width: 24, height: 24), // Google icon
                                onPressed: _handleGoogleSignIn,
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
                                icon: SvgPicture.asset('assert/apple_logo.svg',
                                    width: 24, height: 24), // Google icon
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
          ),
        ),
      ),
    );
  }
}
