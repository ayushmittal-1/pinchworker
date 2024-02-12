import 'package:easy_vahan/screens/add_ev/carDetailPage.dart';
import 'package:flutter/material.dart';

class CarAddPage extends StatelessWidget {
  const CarAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Row(
                  children: [Text('Just one more \nstep...',style: TextStyle(fontSize: 46,color: Colors.white,fontFamily: 'Overpass',
                    fontWeight: FontWeight.w400,),)],
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
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
