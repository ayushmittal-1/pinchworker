import 'package:easy_vahan/allVehicleList.dart';
import 'package:easy_vahan/carAddPage.dart';
import 'package:easy_vahan/login%20compo/my_textfield.dart';
import 'package:flutter/material.dart';


class CarDetailsPage extends StatelessWidget {

  CarDetailsPage({Key? key}) : super(key: key);

  final carnumberController = TextEditingController();
  final carcapacitycontroller = TextEditingController();
  final carcompanyController = TextEditingController();
  final carmodelController = TextEditingController();
  final carnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
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
                    ' Promise \n Its last',
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
                controller: carnumberController,
                obscureText: false, hintText: 'Car Number',
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: carcapacitycontroller,
                hintText: 'Capacity',
                obscureText: false,
              ),

              const SizedBox(height: 10),
              MyTextField(
                controller: carcompanyController,
                obscureText: false, hintText: 'CompanyDD',
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: carmodelController,
                obscureText: false, hintText: 'ModelDD',
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: carnameController,
                obscureText: false, hintText: 'Car name',
              ),
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
                        MaterialPageRoute(builder: (context) {return Allvehiclelist();},));}, child: Text(
                    'Add EV',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Exo 2',
                      fontWeight: FontWeight.w400,
                    ),
                  ),)),

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

            ],
          ),
        ),
      ),
    );
  }
}
