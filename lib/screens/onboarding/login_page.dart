import 'package:easy_vahan/components/my_button.dart';
import 'package:easy_vahan/components/my_textfield.dart';
import 'package:easy_vahan/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_vahan/screens/onboarding/view_models/login_vm.dart';

import '../add_ev/carAddPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginAuthViewModel>(builder: (context, authVm, _) {
      _emailController.text = authVm.email;
      _passwordController.text = authVm.password;
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),

                    // welcome back, you've been missed!
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' Hey There\n Welcome back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // username textfield
                    TextFormField(
                        decoration:  InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        controller: _emailController,
                        obscureText: false,
                        onChanged: (value) => authVm.setEmail(value)),

                    const SizedBox(height: 10),

                    // password textfield
                    TextFormField(
                        decoration:  InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        controller: _passwordController,
                        obscureText: !authVm.passwordVisible,
                        onChanged: (value) => authVm.setPassword(value)),

                    const SizedBox(height: 10),

                    // forgot password?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // sign in button
                    MyButton(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context){return CarAddPage(); }));
                        print("Here");
                        print(authVm.email);
                        print(authVm.password);
                        // if (_formKey.currentState!.validate()) {
                        await authVm.loginApi(context);

                        // }
                      },
                    ),

                    const SizedBox(height: 50),

                    // or continue with
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    // google + apple sign in buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        // google button
                        SquareTile(imagePath: 'assets/images/login/Google.png'),

                        SizedBox(width: 25),

                        // apple button
                        SquareTile(imagePath: 'assets/images/login/Apple.png')
                      ],
                    ),

                    const SizedBox(height: 50),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
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
      );
    });
  }
}
