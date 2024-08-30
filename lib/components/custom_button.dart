import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Function()? onTap;
  const CustomButton({super.key, required this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80.screenWidth,
        height: 7.screenHeight,
        decoration: BoxDecoration(
            color: color ?? const Color(0xff6a62b7),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(color: Colors.white, fontSize: 4.5.screenWidth),
          ),
        ),
      ),
    );
  }
}
