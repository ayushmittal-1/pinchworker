import 'package:easy_vahan/screens/add_ev/allVehicleList.dart';
import 'package:flutter/material.dart';
import 'package:easy_vahan/screens/add_ev/view_model/add_car_vm.dart';
import 'package:provider/provider.dart';

class CarDetailsPage extends StatelessWidget {
  CarDetailsPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final _carNumberController = TextEditingController();
  final _carCapacityController = TextEditingController();
  final _carCompanyController = TextEditingController();
  final _carModelController = TextEditingController();
  final _carNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCarViewModel>(builder: (context, carVm, _) {
      _carNumberController.text = carVm.carName;
      _carCapacityController.text = carVm.capacity;
      _carCompanyController.text = carVm.company;
      _carModelController.text = carVm.model;
      _carNameController.text = carVm.carName;

      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 1),

                    // welcome back, you've been missed!
                    const Row(
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
                    TextFormField(
                      controller: _carNumberController,
                      onChanged: (value) => carVm.setNumber(value),
                    ),

                    const SizedBox(height: 10),

                    // password textfield
                    TextFormField(
                      controller: _carCapacityController,
                      onChanged: (value) => carVm.setCapacity(value),
                    ),

                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _carCompanyController,
                      onChanged: (value) => carVm.setCompany(value),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _carModelController,
                      onChanged: (value) => carVm.setModel(value),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _carNameController,
                      onChanged: (value) => carVm.setCarName(value),
                    ),
                    const SizedBox(height: 25),

                    // sign in button
                    Container(
                        height: 50,
                        width: 340,
                        decoration: const BoxDecoration(color: Colors.black),
                        child: ElevatedButton(
                          onPressed: () async {
                            await carVm.addCarToDB(context);
                          },
                          child: const Text(
                            'Add EV',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Exo 2',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),

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
          ),
        ),
      );
    });
  }
}
