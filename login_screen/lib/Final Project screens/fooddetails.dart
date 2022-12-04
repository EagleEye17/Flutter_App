import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:login_screen/Final%20Project%20screens/RightDrawer.dart';


class FoodDetails extends StatefulWidget {
  final String selectedFoodUrl;
  FoodDetails({Key key, this.selectedFoodUrl}) :super(key: key);
  @override
  _FoodDetailsState createState() => _FoodDetailsState(selectedFoodUrl);
}

class _FoodDetailsState extends State<FoodDetails> {
  String selectedFoodUrl;
  _FoodDetailsState(this.selectedFoodUrl);
  Map selectedMeal;
  dynamic fg;
  int f = 0;
  String selectedFoodName;
  String selectedThumbnail;
  String selectedFoodIdTag;
  String selectedFoodCategory;
  String selectedFoodTag;
  String selectedFoodOrigin;
  String selectedFoodDrinks;
  String loader;
  Size screenSize;
  
  Future<Response> getFoodInfoData() async {
    Response response = await get (selectedFoodUrl);
    return response;
  }

  @override
  void initState(){
    super.initState();
    getFoodInfoData().then((value1) {
      Map selectedFoodData = jsonDecode(value1.body);
      setState(() {
        loader = "pass";
        f = 1;
        fg = selectedFoodData["meals"];
        selectedMeal = selectedFoodData["meals"] [0];
        selectedFoodName = (selectedMeal["strMeal"]);
        selectedFoodIdTag = (selectedMeal["idMeal"]);
        selectedThumbnail = (selectedMeal["strMealThumb"]);
        selectedFoodCategory = (selectedMeal["strCategory"]);
        selectedFoodTag = (selectedMeal["strTags"]);
        selectedFoodOrigin = (selectedMeal["strArea"]);
        selectedFoodDrinks = (selectedMeal["strDrinkAlternate"]);
        print(selectedFoodUrl); // Double checking on Debug terminal para makita if mao ba na URL ang gipasa
      });
     }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: 
        Text("$selectedFoodName", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
        actions: [
          Builder(builder: (context) => IconButton(
            icon: Icon(Icons.person), 
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ))
        ],
        ),
      endDrawer: RightDrawer(),
      body: Stack(
          children: <Widget> [ 
          
          Opacity( // Transparent Background
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
          Container(
            child: 
            loader != null
            ?
            SingleChildScrollView(
              child: Column( 
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container( // Food Thumbnail
                  height: 400,
                  child: Image(image: NetworkImage(selectedThumbnail), fit: BoxFit.fill,),
                ),

                Container( // Food Name
                  margin: EdgeInsets.only(bottom: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("$selectedFoodName", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20),)
                    ],
                  )
                ),

                Container( // Food ID
                  margin: EdgeInsets.only(left: 25, bottom: 25),
                  child: Row(
                    children: [
                      Text("ID: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15)),
                      Text("$selectedFoodIdTag", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15))
                    ],
                  )
                ),

                Container( // Food Category
                  margin: EdgeInsets.only(left: 25, bottom: 25),
                  child: Row(
                    children: [
                      Text("Category: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15)),
                      Text("$selectedFoodCategory", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15))
                    ],
                  )
                ),

                Container( // Food Tag
                  margin: EdgeInsets.only(left: 25, bottom: 25),
                  child: Row(
                    children: [
                      Text("Food Tags: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15)),
                      AutoSizeText("$selectedFoodTag", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15), maxLines: 2,)
                    ],
                  )
                ),

                Container( //Food Origin
                  margin: EdgeInsets.only(left: 25, bottom: 25),
                  child: Row(
                    children: [
                      Text("Food Origin: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15)),
                      Text("$selectedFoodOrigin", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15))
                    ],
                  )
                ),

                Container(
                  margin: EdgeInsets.only(left: 25, bottom: 20),
                  child: Row(
                    children: [
                      Text("Reccomended or Alternative Drinks: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                      AutoSizeText("$selectedFoodDrinks", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15,), maxLines: 2,),
                    ],
                  ),
                ),
              ],
            ) 
          )
          : Container(child: Center(child: SpinKitWave(color: Colors.blue),)),
        ),
        ]
      ),
    );
 }
}