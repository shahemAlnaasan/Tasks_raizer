import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:task_one/components/custom_button.dart';
import 'package:task_one/components/text_field.dart';
import 'package:task_one/controller/sign_in_controller.dart';

// comment This import if you want to use Cubit
import 'package:task_one/bloc/login_button_bloc.dart';

// comment This import if you want to use BloC
// import 'package:task_one/cubit/login_button_cubit.dart';

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

            // BlocBuilder<LoginButtonCubit, LoginButtonState>(
            //                       builder: (context, state) {
            //                         if (state is ButtonState) {
            //                           return CustomButton(
            //                             onTap: () {
            //                               if (SignInController
            //                                   .formState.currentState!
            //                                   .validate()) {
            //                                 context
            //                                     .read<LoginButtonCubit>()
            //                                     .showUserInfo();
            //                               }
            //                             },
            //                             title: "LOGIN",
            //                           );
            //                         } else if (state is UserInfoState) {
            //                           return Column(
            //                             children: [
            //                               Text("UserName: ${state.userName}"),
            //                               Text("Password: ${state.password}"),
            //                             ],
            //                           );
            //                         } else {
            //                           return const SizedBox();
            //                         }
            //                       },
            //                     )
            BlocBuilder<LoginButtonBloc, LoginButtonState>(
              builder: (context, state) {
                if (state is ButtonState) {
                  return CustomButton(
                    onTap: () {
                      if (SignInController.formState.currentState!.validate()) {
                        context.read<LoginButtonBloc>().add(ShowUSerInfo());
                      }
                    },
                    title: "LOGIN",
                  );
                } else if (state is UserInfoState) {
                  return Column(
                    children: [
                      Text("UserName: ${state.userName}"),
                      Text("Password: ${state.password}"),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
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
