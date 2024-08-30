import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:task_one/sign-in_landscape.dart';
import 'package:task_one/components/circle.dart';
import 'package:task_one/components/custom_button.dart';
import 'package:task_one/components/text_field.dart';
import 'package:task_one/controller/sign_in_controller.dart';

// comment This import if you want to use Cubit
import 'package:task_one/bloc/login_button_bloc.dart';

// comment This import if you want to use bloc
// import 'package:task_one/cubit/login_button_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void dispose() {
    SignInController.usernameController.dispose();
    SignInController.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: SignInController.formState,
          child: SizedBox(
            height: orientation == Orientation.portrait
                ? 1040.screenHeight
                : 480.screenHeight,
            width: orientation == Orientation.portrait
                ? 480.screenWidth
                : 1040.screenWidth,
            child: SingleChildScrollView(
              reverse: true,
              child: Stack(
                children: [
                  //Pig Circle
                  Positioned(
                      left: -20.screenWidth,
                      top: -15.sh,
                      child: Circle(
                        height: 31.screenHeight,
                        width: 62.screenWidth,
                      )),

                  //Small Circle
                  Positioned(
                      right: -20.screenWidth,
                      top: 12.sh,
                      child: Circle(
                        width: 33.screenWidth,
                        height: 12.screenHeight,
                      )),

                  //Bottom Circle
                  Positioned(
                    left: 1.5.screenWidth,
                    right: 1.5.screenWidth,
                    bottom:
                        orientation == Orientation.portrait ? -10.sh : -14.sh,
                    child: Circle(
                      width: 33.screenWidth,
                      height: 19.screenHeight,
                      color: Colors.grey[300],
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: orientation == Orientation.portrait
                                ? 3.5.screenHeight
                                : 1.screenHeight),
                        child: Text(
                          "Don't have an account? Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff6a62b7),
                              fontSize: 4.screenWidth),
                        ),
                      ),
                    ),
                  ),

                  //
                  SizedBox(
                      height: orientation == Orientation.portrait
                          ? 100.screenHeight
                          : 49.screenHeight,
                      child: orientation == Orientation.portrait
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                        fontSize: 7.screenWidth,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                                SizedBox(height: 2.screenHeight),

                                //Logo
                                Image.asset(
                                  "images/welcome.png",
                                  width: 75.screenWidth,
                                ),
                                SizedBox(height: 2.screenHeight),

                                //Username TextField
                                CustomtextField(
                                  validator: (val) {
                                    if (val == "") {
                                      return "You must enter a vaild email ";
                                    }
                                    return null;
                                  },
                                  hintText: 'Username',
                                  prefixIcon: const Icon(Icons.email_rounded),
                                  controller:
                                      SignInController.usernameController,
                                ),

                                SizedBox(height: 2.screenHeight),

                                //Password TextField
                                CustomtextField(
                                  validator: (val) {
                                    if (val == "") {
                                      return "You must enter a vaild password ";
                                    }
                                    return null;
                                  },
                                  hintText: 'Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  controller:
                                      SignInController.passwordController,
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

                                //With Cubit

                                // BlocBuilder<LoginButtonCubit, LoginButtonState>(
                                //   builder: (context, state) {
                                //     if (state is ButtonState) {
                                //       return CustomButton(
                                //         onTap: () {
                                //           if (SignInController
                                //               .formState.currentState!
                                //               .validate()) {
                                //             context
                                //                 .read<LoginButtonCubit>()
                                //                 .showUserInfo();
                                //           }
                                //         },
                                //         title: "LOGIN",
                                //       );
                                //     } else if (state is UserInfoState) {
                                //       return Column(
                                //         children: [
                                //           Text("UserName: ${state.userName}"),
                                //           Text("Password: ${state.password}"),
                                //         ],
                                //       );
                                //     } else {
                                //       return const SizedBox();
                                //     }
                                //   },
                                // )

                                // With BloC

                                BlocBuilder<LoginButtonBloc, LoginButtonState>(
                                  builder: (context, state) {
                                    if (state is ButtonState) {
                                      return CustomButton(
                                        onTap: () {
                                          if (SignInController
                                              .formState.currentState!
                                              .validate()) {
                                            context
                                                .read<LoginButtonBloc>()
                                                .add(ShowUSerInfo());
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
                            )

                          //////////////////////////////////
                          : const SignInLandscape())
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
