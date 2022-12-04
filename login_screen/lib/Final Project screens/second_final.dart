import 'dart:convert';
import "package:flutter/material.dart";
import "package:http/http.dart";
import 'package:login_screen/Final%20Project%20screens/RightDrawer.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:login_screen/Final%20Project%20screens/fooddetails.dart';


class MenuSelection extends StatefulWidget {
  @override
  _MenuSelectionState createState() => _MenuSelectionState();
}

class _MenuSelectionState extends State<MenuSelection> {
String foodUrl = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood";
String url = "";
dynamic foodurl;
Map foodarray = new Map();
String loader;
List <dynamic> a = [];
List <dynamic> foodPicture = [];
List <dynamic> foodName = [];
List <dynamic> foodIdTag = [];
MediaQuery screenSize;

Future<Response> getFoodData() async{
  Response response = await get(Uri.parse(foodUrl));
  return response;
}

  @override

  void initState(){
    super.initState();

    getFoodData().then((value) {
      Map data = jsonDecode(value.body);
      a = data["meals"];
      setState(() {
        url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=";
        loader = "pass";

        for (int i=0; i<a.length; i++){
          foodarray = data["meals"] [i];
          foodName.add(foodarray["strMeal"]);
          foodPicture.add(foodarray["strMealThumb"]);
          foodIdTag.add(foodarray["idMeal"]);

          print(url);
        }
      });
    });
  }

  @override

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: 
        Text("Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
        actions: [
          Builder(builder: (context) => IconButton(
            icon: Icon(Icons.person), 
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ))
        ],
        ),
      endDrawer: new RightDrawer(),
      body: 
      Stack( 
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: AssetImage('assets/Grand Canyon.jpg'),
                fit: BoxFit.cover,
              ),
            )
          ),
          Expanded( 
            child: GridView.count( //Grid View Layout
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              childAspectRatio: (screenSize.width / 640),
              // padding: const EdgeInsets.all(3), 
              children: List.generate(a.length, (index)
                {
                  return
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      width: screenSize.width,
                      height: screenSize.height * .9,
                      child: FlatButton(
                        onPressed: () {
                          foodurl = url + foodIdTag[index];
                          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) =>  FoodDetails(selectedFoodUrl: foodurl)));
                        },
                        child:  
                        loader != null
                        ?
                        InkWell(
                        child: Expanded(
                            child: Container( 
                              decoration: BoxDecoration(
                              color: Colors.pink[300],
                              border: Border.all(
                                color: Colors.white,
                                width: 2
                                ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: 
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Column(
                                children: [
                                  Container( // Container for the Food Picture
                                  margin: EdgeInsets.only(top: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(foodPicture[index], height: 150, width: 150, fit: BoxFit.fill),
                                  ),
                                  ),
                                  SizedBox(height: 10),
                                  Container( // Container for the Food Name
                                    margin: EdgeInsets.only(top: 2, left: 5, right: 5),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: 
                                        Border.all(width: 2),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          foodName[index],
                                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15), textAlign: TextAlign.center,
                                        ),
                                      )
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Text("Php 200.00", style: TextStyle(fontWeight: FontWeight.w600),)
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    height: 25,
                                    width: 150,
                                    color: Colors.green[300],
                                    child: Center(
                                      child: Text("Buy Now", style: TextStyle(fontWeight: FontWeight.w600,)),
                                      )
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    height: 25,
                                    width: 150,
                                    color: Colors.blue[300],
                                    child: Center(
                                      child: Text("Add To Cart", style: TextStyle(fontWeight: FontWeight.w600,)),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ) : Container (child: Center(child: SpinKitWave(color: Colors.blue )), 
                      ) 
                    )
                    ),
                  ]
                );
                }
              )
            ),
          )
        ]
      )
    );
  }
}