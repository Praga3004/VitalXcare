import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'components/button.dart';
import 'components/textfield.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final nameController = TextEditingController();

  final mailController = TextEditingController();

  final phnoController = TextEditingController();

  final dobController = TextEditingController();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFDCEDF9),
        title: Center(child: Text('Edit profile')),
      ),backgroundColor: Color(0xFFDCEDF9),
      body: SingleChildScrollView(
        child: Container(height: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 10),
              Icon(
                Icons.person,
                size: 70,
              ),
          
              //name text field
              SizedBox(height: 20),
              Textfield(
                  controller: nameController,
                  hinttext: 'Enter name :',
                  obscuretext: false),
              SizedBox(height: 10),
              //email text field
              Textfield(
                  controller: mailController,
                  hinttext: 'Enter email :',
                  obscuretext: false),
              SizedBox(height: 10),
          
              //phno text field
              Textfield(
                  controller: phnoController,
                  hinttext: 'Enter phno :',
                  obscuretext: false),
              SizedBox(height: 10),
          
              //dob text field
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  // controller: dobcontroller,
                  decoration: InputDecoration(
                    labelText: "Date",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () {
                    selectDate();
                  },
                ),
              ),
          
              // Textfield(
              //   controller: dobController,
              //   hinttext: '                           date of birth',
              //   obscuretext: false,
          
              // ),
              SizedBox(height: 10),
          
              //save button
              Center(
                child: Button(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  msg: "Save",
                  // color: Color.fromARGB(255, 245, 143, 42),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    // DateTime? picked=
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }
}
