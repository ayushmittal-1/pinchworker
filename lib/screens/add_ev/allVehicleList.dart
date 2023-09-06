import 'package:easy_vahan/screens/add_ev/carDetailPage.dart';
import 'package:easy_vahan/screens/mapscreens/initial.dart';
import 'package:flutter/material.dart';

class Allvehiclelist extends StatefulWidget {
  const Allvehiclelist({Key? key}) : super(key: key);

  @override
  State<Allvehiclelist> createState() => _AllvehiclelistState();
}

class _AllvehiclelistState extends State<Allvehiclelist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Car001'),
                          Image.asset('assets/images/login/Apple.png',height: 50,width: 50,)
                        ],
                      ),
                    ),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(width: 10,)
                ],
              ),
              Row(
                children: [
                  Container(
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return CarDetailsPage();
                            },
                          ));
                        },
                        icon: Icon(Icons.add),
                        label: Text('Add your vehicle')),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey

                    ),
                  ),

                  ElevatedButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {return InitialMapScreen();},));}, child: Text(
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
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
