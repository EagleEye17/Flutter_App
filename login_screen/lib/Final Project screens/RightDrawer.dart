import "package:flutter/material.dart";

class RightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          elevation: 16.0,
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Reymar Rebote"), 
                accountEmail: Text("rbrebote@addu.edu.ph"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.pinkAccent[200],
                  child: Text("R R")
                ),
              ), 
              ListTile(
                title: new Text("Birthday: April 17, 2000"),
              ),
              ListTile(
                title: new Text("College Degree: Bachelor Science in Information Systems - 2A"),
              ),
              ListTile(
                title: new Text("School: Ateneo de Davao University"),
              )
            ],
          )
    );
  }
}