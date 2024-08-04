import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataScreen extends StatefulWidget {

  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  var positioncheckin=" ";
  var positioncheckout=" ";
  var timeanddatecheckin=" ";
  var timeanddatecheckout=" ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    loadData2();
    // setState(() {
   //
    // });

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Spacer(flex: 2,),
              Center(child: Text("Pinch",style: TextStyle(color: Colors.white),)),
              Spacer(flex: 3,)
            ],
          ),
          backgroundColor: Colors.orange,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline, color: Colors.green),
                      SizedBox(width: 8.0),
                      Text(
                        "CHECK IN",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.green),
                      SizedBox(width: 8.0),
                      Text(
                        "Position: $positioncheckin",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.green),
                      SizedBox(width: 8.0),
                      Text(
                        "Time: $timeanddatecheckin",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline, color: Colors.red),
                      SizedBox(width: 8.0),
                      Text(
                        "CHECK OUT",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 8.0),
                      Text(
                        "Position: $positioncheckout",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.red),
                      SizedBox(width: 8.0),
                      Text(
                        "Time: $timeanddatecheckout",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 Future<void> loadData() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();

   String? position = prefs.getString('positionofworker');
   String? datetime = prefs.getString('dateandtime');
   setState(() {
     timeanddatecheckin=datetime.toString();


     positioncheckin=position.toString();
   });
   print("position kya h $positioncheckin");

   // print('Username: $username');
   // print('Age: $age');
   // print('Is Logged In: $isLoggedIn');
 }
  Future<void> loadData2() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();

    String? position = prefs2.getString('positionofworkercheckout');
    String? datetime = prefs2.getString('dateandtimecheckout');
    setState(() {
      timeanddatecheckout=datetime.toString();

      positioncheckout=position.toString();
    });
    print("position kya h checkout $positioncheckout");

    // print('Username: $username');
    // print('Age: $age');
    // print('Is Logged In: $isLoggedIn');
  }
}
