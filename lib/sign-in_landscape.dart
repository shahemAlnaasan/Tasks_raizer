import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:task_one/components/custom_button.dart';
import 'package:task_one/components/text_field.dart';
import 'package:task_one/controller/sign_in_controller.dart';

class SignInLandscape extends StatefulWidget {
  const SignInLandscape({super.key});

  @override
  State<SignInLandscape> createState() => _SignInLandscapeState();
}

class _SignInLandscapeState extends State<SignInLandscape> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: 9.screenHeight),
            SizedBox(
              width: 100.screenWidth,

              //Password TextField
              child: CustomtextField(
                validator: (val) {
                  if (val == "") {
                    return "You must enter a vaild email ";
                  }
                  return null;
                },
                hintText: 'Username',
                prefixIcon: const Icon(Icons.email_rounded),
                controller: SignInController.usernameController,
              ),
            ),
            SizedBox(height: 2.screenHeight),
            SizedBox(
              width: 100.screenWidth,

              //Password TextField
              child: CustomtextField(
                validator: (val) {
                  if (val == "") {
                    return "You must enter a vaild password ";
                  }
                  return null;
                },
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                controller: SignInController.passwordController,
              ),
            ),
            SizedBox(
              width: 75.screenWidth,
              height: 2.5.screenHeight,
              child: const Text(
                "Forgot password?",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 2.screenHeight),
            SignInController.isButtonStill
                ? CustomButton(
                    onTap: () {
                      if (SignInController.formState.currentState!.validate()) {
                        SignInController.removeButton();
                        setState(() {});
                      }
                    },
                    title: "LOGIN",
                  )
                : Column(children: [
                    Text(
                        "Username: ${SignInController.usernameController.text}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text(
                        "Password: ${SignInController.passwordController.text}",
                        style: Theme.of(context).textTheme.bodyMedium)
                  ])
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 7.screenWidth, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 2.screenHeight),

            //Logo
            Image.asset(
              "images/welcome.png",
              width: 75.screenWidth,
            ),
          ],
        ),
      ],
    );
  }
}
