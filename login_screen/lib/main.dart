import 'package:flutter/material.dart';
import 'package:login_screen/Final%20Project%20screens/fooddetails.dart';
import 'package:login_screen/Final%20Project%20screens/second_final.dart';
import 'package:login_screen/shared/Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginApp(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/second': (context) => MenuSelection(),
        '/third' : (context) => FoodDetails(),
      }
    );
  }
}


class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  Size screenSize;
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage('assets/Grand Canyon.jpg'),
              fit: BoxFit.cover
              ),
          ),
          Container(
           child: SingleChildScrollView(
             padding: EdgeInsets.symmetric(
               horizontal: 40.0,
               vertical: 130.0,
             ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Create an Account",
                  style: stylePoppins,
                ),
              ],
            ),
           )
         ),
          Positioned(
            left: 35,
            top: 210,
            child: Container(
              height: 390,
              width: 400,
            color: Colors.white,
            child: Column(
            children: [
            SizedBox(height: 30.0),
            ],
            )
          ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(60, 270, 0, 210),
            height: 70.0,
            //color: Colors.yellow[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 16.0,
                  height:1.0,
                  color: Colors.grey[500],
                )
              ),
              TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  ),
                )
            ],)
          ),
          
          SizedBox(height: 50),

          Container(
            margin: EdgeInsets.fromLTRB(60, 370, 0, 190),
            height: 85.0,
            //color: Colors.yellow[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 16.0,
                  height:0.6,
                  color: Colors.grey[500],
                )
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility)),
                style: TextStyle(
                  fontSize: 25.0,
                  height: 1.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  ),
                )
            ],)
          ),
          Container(
            margin: EdgeInsets.fromLTRB(60, 460, 0, 150),
            child: Row(
              children: [
                Checkbox(
                  value: _checkbox, 
                  activeColor: Colors.pink,
                  onChanged: (value) 
                  {setState(() {
                    _checkbox = !_checkbox;
                    }
                );
                }),
                Text("I agree to the ", 
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  )
                  ),
                Text("Terms and Conditions", 
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink,
                  )
                  )
              ],
            )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(35, 545, 0, 0),
            height: 56.0,
            width: 140.0,
            // color: Colors.grey,
            child: Row(
              children: [
                SizedBox(width: 25),
                Text('Need Help?', 
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
                ),
                SizedBox(width: 15),
              ]
            )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(240, 545, 0, 0),
            height: 56.0,
            width: 160.0,
            color: Colors.pink,
            child: Row(
              children: [
                SizedBox(width: 18),
                Text('Sign Up', 
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)
                ),
                SizedBox(width: 15),
                IconButton(
                  icon: Icon(Icons.east),
                  onPressed:() {
                    Navigator.pushNamed(context, '/second');
                  } ,)
              ],
            )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 680, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", 
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.4,
                  )
                ),
                Text("Sign in", 
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink,
                  )
                )
            ],)
          )
        ]
      )
    );
  }
}