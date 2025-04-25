import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notificationBottomPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 0.5,
        actions: [
          Icon(Icons.notifications_none_outlined,size: 30,),
          SizedBox(width: 10,)
        ],
        title:Text("Notifications"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
        child: Center(child: Text("No notification yet!!!",style: TextStyle(fontSize: 25,color: Colors.black),)),
      ),
    );
  }
}