import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenso/log_in/sign_in_page.dart';
import 'package:xpenso/screen/home_page.dart';
import 'package:xpenso/screen/intro_page.dart';

class signUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff6674D3),Color(0xffE78BBC)])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10,),
            SizedBox(height: 10,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Create\nAccount",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 31,color: Colors.white),)),
            SizedBox(height: 20,),
            SizedBox(height: 20,),
            SizedBox(height: 20,),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 21),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 2
                    )
                  ]
              ),
              child: Center(
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: " Full name",
                      hintStyle: TextStyle(fontFamily: "Poppins",fontSize:15,color: Color(0xff4C4C4C))),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 21),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 2
                    )
                  ]
              ),
              child: Center(
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: " Email",
                      hintStyle: TextStyle(fontFamily: "Poppins",fontSize:15,color: Color(0xff4C4C4C))),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 21),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 2
                    )
                  ]
              ),
              child: Center(
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: " Password",
                      hintStyle: TextStyle(fontFamily: "Poppins",fontSize:17,color: Color(0xff4C4C4C))),
                ),
              ),
            ),
            ElevatedButton(onPressed: ()async{
              var prefs = await SharedPreferences.getInstance();
              prefs.setBool(signInPage.LOGIN_KEY,true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>introPage()));
            },
              style:ElevatedButton.styleFrom(
                  elevation: 5,
                  minimumSize: Size(140, 40),
                  backgroundColor: Color(0xff6674D3),
                  foregroundColor: Colors.white
              ),
              child: Text("Sign Up",style: TextStyle(fontFamily:"Poppins",fontSize: 21,color: Colors.white),),),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Aready have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signInPage()));
                }, child:  Text('Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 15),),)

              ],
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}