import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenso/domain/app_constants.dart';

import '../intro_page.dart';
import '../log_in/sign_in_page.dart';

class splashPage extends StatefulWidget {
  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () async {
      var prefs = await SharedPreferences.getInstance();
      int check = prefs.getInt(AppConstants.USER_ID) ?? 0;

      Widget nextPage = signInPage();

      if (check != 0) {
        nextPage = introPage();
      }

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => nextPage));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asset/image/expenso.png",
              height: 150,
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              "Xpenso",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 31,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
