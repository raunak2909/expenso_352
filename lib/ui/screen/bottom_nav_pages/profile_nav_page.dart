import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../log_in/sign_in_page.dart';

class profileBottomPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 0.5,
        actions: [
         IconButton(onPressed: ()async{
           var prefs = await SharedPreferences.getInstance();
           prefs.setBool(signInPage.LOGIN_KEY, false);
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signInPage()));
         },
             icon: Icon(Icons.logout_rounded,size: 30,color: Colors.redAccent,)),
          SizedBox(width: 8,)
        ],
        title:Text("Profile"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListTile(
          leading: Image.asset("asset/image/avatar.png",height: 80,),
          title: Text("Aditya Singh"),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: "Poppins",color: Colors.black),
        ),
      ),
    );
  }
}