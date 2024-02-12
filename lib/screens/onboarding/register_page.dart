import 'package:easy_vahan/components/my_button.dart';
import 'package:easy_vahan/components/square_tile.dart';
import 'package:easy_vahan/screens/add_ev/carAddPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_vahan/screens/onboarding/view_models/register_vm.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterAuthViewModel>(builder: (context, authVm, _) {
      _nameController.text = authVm.name;
      _emailController.text = authVm.email;
      _passwordController.text = authVm.password;
      _confirmController.text = authVm.confirmPass;

      return Scaffold(
        body: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 1),
                        // welcome back, you've been missed!
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ' Lets get it \n ready for you',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontFamily: 'Overpass',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // username textfield
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Name',
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          controller: _nameController,
                          obscureText: false,
                          onChanged: (value) => authVm.setName(value),
                        ),

                        const SizedBox(height: 10),

                        // password textfield
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          controller: _emailController,
                          obscureText: false,
                          onChanged: (value) => authVm.setEmail(value),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          controller: _passwordController,
                          obscureText: !authVm.passwordVisible,
                          onChanged: (value) => authVm.setPassword(value),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          controller: _confirmController,
                          obscureText: !authVm.passwordVisible,
                          onChanged: (value) => authVm.setConfirmPass(value),
                        ),
                        // forgot password?
                        const SizedBox(height: 25),
                        // sign in button
                        MyButton(
                          onTap: () async {
                            await authVm.signUpApi(context);
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return CarAddPage();
                            // }));
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Or',
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // google button
                            SquareTile(
                                imagePath: 'assets/images/login/Google.png'),

                            SizedBox(width: 25),

                            // apple button
                            SquareTile(
                                imagePath: 'assets/images/login/Apple.png')
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
          ),
        ),
      );
    });
  }
}
