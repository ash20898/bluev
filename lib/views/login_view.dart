import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_login_ui/views/loginsignupcontainer.dart';

import '../constants.dart';
import '../controller/simple_ui_controller.dart';
import '../home/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildLargeScreen(size, simpleUIController);
            } else {
              return _buildSmallScreen(size, simpleUIController);
            }
          },
        ),
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: RotatedBox(
            quarterTurns: 3,
            child: Lottie.asset(
              'assets/coin.json',
              height: size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: _buildMainBody(
            size,
            simpleUIController,
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Center(
      child: _buildMainBody(
        size,
        simpleUIController,
      ),
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .35,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: size.width > 600
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                //size.width > 600 ? Container() : PageContainer(),
                SizedBox(
                  height: size.height * 0.012,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Login',
                    style: kLoginTitleStyle(size),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),

                        /// username or Gmail
                        TextFormField(
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Username or Gmail',
                            hintStyle: TextStyle(fontFamily: 'mont'),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          controller: nameController,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            } else if (value.length < 4) {
                              return 'at least enter 4 characters';
                            } else if (value.length > 13) {
                              return 'maximum character is 13';
                            }
                            return null;
                          },
                        ),
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        // TextFormField(
                        //   controller: emailController,
                        //   decoration: const InputDecoration(
                        //     prefixIcon: Icon(Icons.email_rounded),
                        //     hintText: 'gmail',
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.all(Radius.circular(15)),
                        //     ),
                        //   ),
                        //   // The validator receives the text that the user has entered.
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter gmail';
                        //     } else if (!value.endsWith('@gmail.com')) {
                        //       return 'please enter valid gmail';
                        //     }
                        //     return null;
                        //   },
                        // ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),

                        /// password
                        Obx(
                          () => TextFormField(
                            style: kTextFormFieldStyle(),
                            controller: passwordController,
                            obscureText: simpleUIController.isObscure.value,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_open),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  simpleUIController.isObscure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  simpleUIController.isObscureActive();
                                },
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(fontFamily: 'mont'),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else if (value.length < 7) {
                                return 'at least enter 6 characters';
                              } else if (value.length > 13) {
                                return 'maximum character is 13';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                          style: kLoginTermsAndPrivacyStyle(size),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),

                        /// Login Button
                        loginButton(),
                        SizedBox(
                          height: size.height * 0.01,
                        ),

                        /// Navigate To Login Screen
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            nameController.clear();
                            emailController.clear();
                            passwordController.clear();
                            _formKey.currentState?.reset();
                            simpleUIController.isObscure.value = true;
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Don\'t have an account?',
                              style: kHaveAnAccountStyle(size),
                              children: [
                                TextSpan(
                                  text: " Sign up",
                                  style: kLoginOrSignUpTextStyle(size),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          child: Text(
                            'Or Login with',
                            style: kHaveAnAccountStyle(size),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/facebookn.png',
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Image.asset(
                              'assets/googlen.png',
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Login Button
  Widget loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xff3BF266),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 20,
            fontFamily: 'cairo',
          ),
        ),
      ),
    );
  }
}
