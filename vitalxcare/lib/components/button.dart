import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String msg;
  final String? content; // Made content nullable
  final IconData? icon;
  final Color? icon_color;
  final Color? button_color;
  final IconData? suffixicon;
  final double? fontSize;
  final double? sufSize;

  const Button(
      {super.key,
      required this.onTap,
      required this.msg,
      this.content,
      this.icon,
      this.icon_color,
      this.button_color,
      this.suffixicon,
      this.fontSize,
      this.sufSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: button_color != null ? button_color : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) // Check if icon is provided
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: icon_color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon!,
                    size: 35, // Adjust icon size as needed
                  ),
                ),
              ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      msg,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 5), // Add spacing between texts
                  if (content != null &&
                      content!
                          .isNotEmpty) // Check if content is not null and not empty
                    Center(
                      child: Text(
                        content!,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: fontSize != null ? fontSize : 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (suffixicon != null) // Check if icon is provided
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
             
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    suffixicon!,
                    size:sufSize!=null?sufSize: 50, // Adjust icon size as needed
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
