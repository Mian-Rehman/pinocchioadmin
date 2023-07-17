import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinocchioadmin/user_list_screen.dart';

import 'admin_login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
       children: <Widget>[
         Column(
           children: [
             const SizedBox(
               height: 20,
             ),
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: SizedBox(
                 width: 200,
                 child: InkWell(
                   onTap: () {
                     Navigator.pushReplacement(
                         context,
                         MaterialPageRoute(
                           builder: (context) => AdminLoginScreen(),
                         ));
                   },
                   child: const Text(
                     "Logout",
                     style: TextStyle(
                       color: Colors.blueAccent,
                       fontWeight: FontWeight.w600,
                       fontSize: 21,
                     ),
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: 20,
             ),

             Padding(
                 padding: EdgeInsets.all(10.0),
               child: Table(
                children: [
                  TableRow(children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        "",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160.0,
                      width: 160.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserListScreen(),
                              ));
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/user.png",
                                    width: 64.0,
                                  ),
                                  SizedBox(height: 20.0),
                                  const Text("User Documents",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        "",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]),
                ],
               ),
             ),

           ],
         )
       ],
      ),
    );
  }
}
