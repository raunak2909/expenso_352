import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenso/ui/screen/log_in/sign_up_page.dart';

import '../intro_page.dart';
import 'login/login_bloc.dart';
import 'login/login_event.dart';
import 'login/login_state.dart';

class signInPage extends StatefulWidget {
  static const String LOGIN_KEY = 'isLogin';

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff6674D3), Color(0xffE78BBC)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome\nBack",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 31,
                      color: Colors.white),
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 21),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
              child: Center(
                child: TextField(
                  controller: emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: " Email",
                      hintStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          color: Color(0xff4C4C4C))),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 21),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 2)]),
              child: Center(
                child: TextField(
                  controller: passController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration.collapsed(
                      hintText: " Password",
                      hintStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 17,
                          color: Color(0xff4C4C4C))),
                ),
              ),
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
               if(state is LoginLoadingState){
                 isLoading = true;
                 setState(() {

                 });
               }

               if(state is LoginSuccessState){
                 isLoading = false;
                 Navigator.push(context, MaterialPageRoute(builder: (context) => introPage()));
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged in successfully!!')));
               }

               if(state is LoginFailureState){
                 isLoading = false;
                 setState(() {

                 });
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
               }
              },
              child: ElevatedButton(
                onPressed: () async {
                  context.read<LoginBloc>().add(AuthenticateUserEvent(
                      email: emailController.text, pass: passController.text));
                },
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    minimumSize: Size(140, 40),
                    backgroundColor: Color(0xff6674D3),
                    foregroundColor: Colors.white),
                child: isLoading ? Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 11,),
                    Text('Logging in...')
                  ],
                ):Text(
                  "Log in",
                  style: TextStyle(
                      fontFamily: "Poppins", fontSize: 21, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Foget Password ?",
              style: TextStyle(
                  fontFamily: "Poppins", fontSize: 15, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signUpPage()));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 15),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
