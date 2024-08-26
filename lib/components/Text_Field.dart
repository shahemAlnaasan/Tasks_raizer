import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomtextField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomtextField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.screenWidth),
      child: SizedBox(
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffdfdced),
              prefixIcon: prefixIcon,
              prefixIconColor: const Color(0xff6a62b7),
              hintText: hintText,
              hintStyle: const TextStyle(fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
