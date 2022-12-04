import "package:flutter/material.dart";

 
class SecondScreen extends StatefulWidget{
  @override 
  _SecondScreenState createState() => _SecondScreenState();

}

class _SecondScreenState extends State<SecondScreen> {
  int selectedRadio;
  int selectRadioTile;
  int numm;
  @override 
  void initState(){
    super.initState();
    selectedRadio = 0;
    selectRadioTile = 0;
  }

  setSelectedRadioTile(int val){
    setState(() {
      selectRadioTile = val;
      numm = val;
    });
  }

   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Country", textAlign: TextAlign.center),
        backgroundColor: Colors.pink[400],
      ),
      body: Column(
         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.end,
         children: [
           SizedBox(height: 150),
           Container(
             padding: EdgeInsets.symmetric(vertical:10),
             child: RadioListTile(
               value: 1, 
               groupValue: selectRadioTile, 
               title: ListTile(
                 leading: Image.asset('assets/flags/phl.jpg', width: 90),
                 title: Text("    Asia/Manila",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ))
               ),
               onChanged: (val){setSelectedRadioTile(val);
               },
                activeColor: Colors.green,
             ),
           ),
           Container(
             padding: EdgeInsets.symmetric(vertical:10),
             child: RadioListTile(
               value: 2, 
               groupValue: selectRadioTile, 
               title: ListTile(
                 leading: Image.asset('assets/flags/asuncion.png', width: 90),
                 title: Text("    America/Asuncion",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ))
               ),
               onChanged: (val){setSelectedRadioTile(val);
               },
                activeColor: Colors.green,
             ),
           ),
           Container(
             padding: EdgeInsets.symmetric(vertical:10),
             child: RadioListTile(
               value: 3, 
               groupValue: selectRadioTile, 
               title: ListTile(
                 leading: Image.asset('assets/flags/egypt.png', width: 90),
                 title: Text("    Egypt/Cairo",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ))
               ),
               onChanged: (val){setSelectedRadioTile(val);
               },
                activeColor: Colors.green,
             ),
           ),
           Row (
             mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
                 child: 
                 RaisedButton(
                   color: Colors.pink[400],
                   child: Text("Next >>", 
                    style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                   ),),
                  onPressed: (){
                    if (numm == 1) {
                      Navigator.pushNamed(context, '/manila');
                     }
                     else if (numm == 2) {
                       Navigator.pushNamed(context, '/asuncion');
                     }
                     else if (numm == 3) {
                       Navigator.pushNamed(context, '/cairo');
                     }
                   },
                 )
               )
             ],
           )
         ],
      ),
    );
  }
}