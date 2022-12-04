import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/Material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class Cairo extends StatefulWidget {
  @override
  _CairoState createState() => _CairoState();
}

class _CairoState extends State<Cairo> {
  String timeURL= 'https://worldtimeapi.org/api/timezone/Africa/Cairo';
  String currtime;
  String currdate;
  String finaltime;
  
  var temp = [];
  var arr = [];
  var arr2 = [];
  @override
  void initState(){
    super.initState();
    getTimeData().then((value) {
      Map data = jsonDecode(value.body);
      setState(() {
        currdate = data['datetime'];
        arr = currdate.split('T');
        currdate = arr[0];
        temp = arr[1].split('.');
        currtime = temp[0];
        finaltime = currdate + ' ' + currtime;
        finaltime = converttime(finaltime);
        arr2 = finaltime.split('T');

        currdate = arr2[0];
        currtime = arr2[1];
        print(currdate);
        print(currtime);
      });
  });

  }

  String converttime(String time){
    DateTime b= DateTime.parse(time);
    String a;
    a = DateFormat("MMM. d y Th:mm:ss a").format(b);
    return a;
  }

  Future<Response> getTimeData() async{
   Response response = await get(timeURL);
   return response;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Africa - Cairo, Egypt", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.pink[300],
    ),
    body: 
      Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child:
          currdate!=null
          ?Column(
            children: [
            SizedBox(height: 150),
            Image(height: 80, image: AssetImage("assets/flags/egypt.png",)),
            SizedBox(height: 20),
            Text("Africa/Cairo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'Poppins'),
                ),
            SizedBox(height: 20),
            Center(child:
              Text(currdate, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1))  
              ),
            SizedBox(height: 20),
            Center(child: 
              Text(currtime, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 1)),)
            ],
      )
      : Center(child: SpinKitFadingGrid(color: Colors.blue[400],),)
    )
    );
  }
}