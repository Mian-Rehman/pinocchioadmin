import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinocchioadmin/helper/custom_color.dart';

import 'admin_login_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminLoginScreen(),));

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: CustomColor().mMainColor(),
         child: Center(child: Text("PINOCCHIO ADMIN",style: TextStyle(fontSize: 18,color: Colors.white),)),
        ),

    );
  }
}
