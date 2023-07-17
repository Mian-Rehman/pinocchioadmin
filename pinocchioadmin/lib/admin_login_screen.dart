import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinocchioadmin/helper/custom_color.dart';

import 'home_screen.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserValues();
  }

  var myFormkey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  final collectRef = FirebaseFirestore.instance.collection("AdminAccess");
  var username = "",password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 20,),
            Text("Admin Login Panal",style: TextStyle(
              fontSize: 21,
              color: CustomColor().mMainColor(),
              fontWeight: FontWeight.w600,
            ),),
            const SizedBox(height: 20,),
            Center(
              child:  Container(
                color: Colors.white,
                width: 400,
                child:  Form(
                    key: myFormkey,
                    child: Column(
                      children: <Widget>[
                        //username
                        Padding(padding: EdgeInsets.all(10.0),
                          child:
                          TextFormField(

                            controller: userNameController,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Enter Username";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Admin Username",
                                hintText: "Admin Username",
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                )
                            ),
                          ),
                        ),
                        //password
                        Padding(padding: EdgeInsets.all(10.0),
                          child:
                          TextFormField(

                            controller: passwordController,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Enter Password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Admin Password",
                                hintText: "Admin Password",
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                )
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              width: 300,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(21)),
              ),
              child: ElevatedButton(
                onPressed: (){
                  if(username == userNameController.text.toString()){
                    if(password == passwordController.text.toString()){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                    }else{

                    }
                  }else{

                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text("Login",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            )

          ],
        ),
      ),
    );
  }

  void getUserValues() {
    collectRef.doc("admindetails").get().then((DocumentSnapshot snapshot) {
      if(snapshot.exists){
        username = snapshot.get("username");
        password = snapshot.get("password");
      }
    });
  }
}
