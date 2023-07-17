import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  FirebaseFirestore firestoredatabase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("User KYC Documents"),
     ),
     body: ListView(
       children: [
         Column(
           children: [
             Padding(padding: EdgeInsets.all(10.0)
               ,
               child: Table(
                 columnWidths: {
                   0: FlexColumnWidth(2),
                   1: FlexColumnWidth(4),
                   2: FlexColumnWidth(2),
                 },
                 children: [
                   TableRow(
                       children: [
                         Container(
                           child: Text(""),
                         ),

                         Visibility(
                           visible: true,
                           child: Container(
                               height: 400,
                               padding: EdgeInsets.all(10.0),
                               child: StreamBuilder<QuerySnapshot>(
                                   stream: FirebaseFirestore.instance.collection('userDocumentVerification')

                                       .snapshots(),
                                   builder: (context,snapshots){
                                     return (snapshots.connectionState == ConnectionState.waiting)
                                         ?Center(

                                     ): ListView.builder(
                                         itemCount: snapshots.data!.docs.length,
                                         itemBuilder: (context, index){
                                           var data = snapshots.data!.docs[index].data()
                                           as Map<String,dynamic>;
                                           return Container(
                                               margin: EdgeInsets.all(10.0),
                                               decoration: const BoxDecoration(
                                                 color: Colors.amber,
                                                 borderRadius: BorderRadius.all(Radius.circular(10)),
                                               ),
                                               child: Padding(
                                                 padding: EdgeInsets.all(5.0),
                                                 child: ListTile(
                                                   title: Padding(
                                                     padding: EdgeInsets.all(5.0),
                                                     child: Text("Full Name ${data['fullName']}"
                                                       ,maxLines: 1,
                                                       overflow: TextOverflow.ellipsis,
                                                       style: TextStyle(
                                                         color: Colors.black,
                                                         fontSize: 16,
                                                         fontWeight: FontWeight.w600,
                                                       ),),
                                                   ),
                                                   subtitle: Padding(
                                                       padding: EdgeInsets.all(5.0),
                                                       child: Column(
                                                         mainAxisAlignment: MainAxisAlignment.start,
                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                         children: [
                                                           Row(
                                                             children: [
                                                               Padding(
                                                                 padding: EdgeInsets.all(5.0),
                                                                 child: Text("Verification Type: ${data['verificationType']}"
                                                                   ,maxLines: 1,
                                                                   overflow: TextOverflow.ellipsis,
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontSize: 14,
                                                                     fontWeight: FontWeight.w600,
                                                                   ),),
                                                               ),
                                                               SizedBox(width: 30,),
                                                               Container(

                                                                 alignment: AlignmentDirectional.centerEnd,
                                                                 child: ElevatedButton(
                                                                   onPressed: (){
                                                                     String url = data['idCardFront'].toString();
                                                                     _openUrlInNewTab(url);
                                                                   },
                                                                   child: Text("Front Image"),
                                                                 ),
                                                               ),

                                                               SizedBox(width: 30,),
                                                               Container(

                                                                 alignment: AlignmentDirectional.centerEnd,
                                                                 child: ElevatedButton(
                                                                   onPressed: (){
                                                                     String url = data['idCardFront'].toString();
                                                                     _openUrlInNewTab(url);
                                                                   },
                                                                   child: Text("Back Image"),
                                                                 ),
                                                               ),
                                                             ],
                                                           ),

                                                           Padding(padding: EdgeInsets.all(5.0),
                                                             child:  Text("Number:  ${data['number']}"
                                                               ,maxLines: 1,
                                                               overflow: TextOverflow.ellipsis,
                                                               style: TextStyle(
                                                                 color: Colors.black,
                                                                 fontSize: 14,
                                                                 fontWeight: FontWeight.w600,
                                                               ),),
                                                           ),

                                                           Padding(padding: EdgeInsets.all(5.0),
                                                             child:  Text("Expire Date:  ${data['expireDate']}"
                                                               ,maxLines: 1,
                                                               overflow: TextOverflow.ellipsis,
                                                               style: TextStyle(
                                                                 color: Colors.black,
                                                                 fontSize: 14,
                                                                 fontWeight: FontWeight.w600,
                                                               ),),
                                                           ),

                                                           Padding(padding: EdgeInsets.all(5.0),
                                                             child:  Text("Date Of Birth:  ${data['dateOfBirth']}"
                                                               ,maxLines: 1,
                                                               overflow: TextOverflow.ellipsis,
                                                               style: TextStyle(
                                                                 color: Colors.black,
                                                                 fontSize: 14,
                                                                 fontWeight: FontWeight.w600,
                                                               ),),
                                                           ),

                                                           Row(
                                                             children: [
                                                               Padding(padding: EdgeInsets.all(5.0),
                                                                 child:  Text("Approval Status  ${data['verification']}"
                                                                   ,maxLines: 1,
                                                                   overflow: TextOverflow.ellipsis,
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontSize: 14,
                                                                     fontWeight: FontWeight.w600,
                                                                   ),),
                                                               ),
                                                               SizedBox(width: 30,),
                                                               Container(

                                                                 alignment: AlignmentDirectional.centerEnd,
                                                                 child: ElevatedButton(
                                                                   onPressed: (){
                                                                    userDocumentStatusUpdate("approved",data['userUID'].toString());
                                                                   },
                                                                   child: Text("Approved"),
                                                                 ),
                                                               ),

                                                               SizedBox(width: 30,),
                                                               Container(

                                                                 alignment: AlignmentDirectional.centerEnd,
                                                                 child: ElevatedButton(
                                                                   onPressed: (){
                                                                     userDocumentStatusUpdate("reject",data['userUID'].toString());
                                                                   },
                                                                   child: Text("Reject"),
                                                                 ),
                                                               ),
                                                             ],
                                                           )
                                                         ],
                                                       )
                                                   ),
                                                   onTap: (){

                                                   },
                                                 ),
                                               )
                                           );
                                         }
                                     );

                                   })

                           ),),
                         Container(
                             child: Text("")
                         ),
                       ]
                   ),

                 ],
               ),
             )
           ],
         )
       ],
     ),
   );
  }

  void _openUrlInNewTab(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url, webOnlyWindowName: '_blank');
    } else {
      throw 'Could not launch $url';
    }
  }

  void userDocumentStatusUpdate(String status,String userUID) async{

    await firestoredatabase.collection("userDocumentVerification").doc(userUID)
        .update({
      "verification" : status,
    }).whenComplete(() {
    showToast(context);
    });

  }

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('This is a toast message.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

}
