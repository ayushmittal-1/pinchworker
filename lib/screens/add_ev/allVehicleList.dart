import 'package:easy_vahan/carDetailPage.dart';
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
                          Text('CarName'),
                          Image.asset('images/electric-car.png',height: 70,width: 200,)
                        ],
                      ),
                    ),
                    height: 125,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),

                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    child: ElevatedButton.icon(onPressed: (){Navigator.push(context,
                        MaterialPageRoute(builder: (context) {return CarDetailsPage();},));} , icon: Icon(Icons.add), label: Text('Add your vehicle')),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey

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
