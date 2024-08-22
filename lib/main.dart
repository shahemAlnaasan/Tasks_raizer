import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:task_one/Sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
        builder: (context) => MaterialApp(
              theme: ThemeData(
                  textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 20,
                  color: Color(0xff6a62b7),
                ),
              )),
              debugShowCheckedModeBanner: false,
              home: const SignInPage(),
            ));
  }
}
