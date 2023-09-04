import 'package:easy_vahan/components/my_button.dart';
import 'package:easy_vahan/components/my_textfield.dart';
import 'package:easy_vahan/components/square_tile.dart';
import 'package:easy_vahan/screens/add_ev/carAddPage.dart';
import 'package:flutter/material.dart';

// class RegisterPage extends StatelessWidget {
//    RegisterPage({Key? key}) : super(key: key);
//
//   final usernameController = TextEditingController();
//   final emailcontroller = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmpasswordController = TextEditingController();
//   // register user in method
//   void registerUserIn() {}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 1),
//                     // welcome back, you've been missed!
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           ' Lets get it \n ready for you',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 48,
//                               fontFamily: 'Overpass',
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     const SizedBox(height: 25),
//
//                     // username textfield
//                     MyTextField(
//                       controller: usernameController,
//                       obscureText: false, hintText: 'Name',
//                     ),
//
//                     const SizedBox(height: 10),
//
//                     // password textfield
//                     MyTextField(
//                       controller: emailcontroller,
//                       hintText: 'Email',
//                       obscureText: false,
//                     ),
//
//                     const SizedBox(height: 10),
//                     MyTextField(
//                       controller: passwordController,
//                       obscureText: true, hintText: 'Password',
//                     ),
//                     const SizedBox(height: 10),
//                     MyTextField(
//                       controller: confirmpasswordController,
//                       obscureText: false, hintText: 'Confirm password',
//                     ),
//                     // forgot password?
//                     const SizedBox(height: 25),
//                     // sign in button
//                     MyButton(
//                       onTap: registerUserIn,
//                     ),
//                     const SizedBox(height: 50),
//                     // or continue with
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Divider(
//                               thickness: 0.5,
//                               color: Colors.grey[400],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                             child: Text(
//                               'Or',
//                               style: TextStyle(color: Colors.grey[700]),
//                             ),
//                           ),
//                           Expanded(
//                             child: Divider(
//                               thickness: 0.5,
//                               color: Colors.grey[400],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     const SizedBox(height: 50),
//
//                     // google + apple sign in buttons
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         // google button
//                         SquareTile(imagePath: 'assets/images/login/Google.png'),
//
//                         SizedBox(width: 25),
//
//                         // apple button
//                         SquareTile(imagePath: 'assets/images/login/Apple.png')
//                       ],
//                     ),
//
//                     const SizedBox(height: 50),
//
//                     // not a member? register now
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Not a member?',
//                           style: TextStyle(color: Colors.grey[700]),
//                         ),
//                         const SizedBox(width: 4),
//                         const Text(
//                           'Register now',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  // register user in method
  void registerUserIn() {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [




                    const SizedBox(height: 1),

                    // welcome back, you've been missed!
                    Row(
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
                    MyTextField(
                      controller: usernameController,
                      obscureText: false, hintText: 'Name',
                    ),

                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: emailcontroller,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),
                    MyTextField(
                      controller: passwordController,
                      obscureText: true, hintText: 'Password',
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: confirmpasswordController,
                      obscureText: false, hintText: 'Confirm password',
                    ),

                    // forgot password?


                    const SizedBox(height: 25),

                    // sign in button
                    Container(
                        height: 50,
                        width: 340,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {return CarAddPage();},));}, child: Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Exo 2',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        )
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
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      ),
    );
  }
}
